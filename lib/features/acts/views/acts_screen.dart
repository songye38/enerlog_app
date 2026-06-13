import 'package:enerlog_app/features/acts/data/activity_feed_model.dart';
import 'package:flutter/material.dart';
import 'package:enerlog_app/core/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActsScreen extends StatefulWidget {
  const ActsScreen({super.key});

  @override
  State<ActsScreen> createState() => _ActsScreenState();
}

class _ActsScreenState extends State<ActsScreen> with TickerProviderStateMixin {
  late TabController _sourceTabController;
  int _selectedEnergyLevel = -1; // -1은 '전체', 0~10은 해당 레벨

  // 📡 서버에서 내려왔다고 가정하는 ActivityFeed 실제 데이터셋
  final List<ActivityFeedModel> _allFeeds = [
    ActivityFeedModel(
      id: "1",
      energyLevel: 4,
      title: "가벼운 산책",
      description: "바람을 쐬며 리프레시",
      count: 12,
      durationMinutes: "20분",
    ),
    ActivityFeedModel(
      id: "2",
      energyLevel: 1,
      title: "눈 감고 명상",
      description: "뇌에 잠깐의 휴식을",
      count: 5,
      durationMinutes: "10분",
    ),
    ActivityFeedModel(
      id: "3",
      energyLevel: 8,
      title: "스쿼트 50회",
      description: "허벅지 득근과 에너지 펌핑",
      count: 3,
      durationMinutes: "15분",
    ),
    // '내가 만든 활동'이라고 가정할 샘플 데이터 (id에 custom이 붙음)
    ActivityFeedModel(
      id: "custom_1",
      energyLevel: 4,
      title: "나만의 카페 코딩",
      description: "작은 몰입의 기쁨",
      count: 2,
      durationMinutes: "1시간",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // 🌟 1. '추천'과 '내가 만든 활동' 리스트 분리 기준 마련
    final recommendedFeeds = _allFeeds
        .where((feed) => !feed.id.startsWith('custom'))
        .toList();
    final customFeeds = _allFeeds
        .where((feed) => feed.id.startsWith('custom'))
        .toList();

    return DefaultTabController(
      length: 2, // 메인 탭: 추천 활동 / 내가 만든 활동
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "행동 탐색",
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.black13,
            ),
          ),
          // 2중 필터/탭 영역 (순서에 맞춰 높이를 최적화했습니다)
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(102.0),
            child: Column(
              children: [
                // 📌 [대반전 완료] 추천 활동 / 내가 만든 활동 메인 탭바가 다시 1층으로 올라옵니다.
                TabBar(
                  labelColor: AppColors.black13,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: AppColors.black13,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    const Tab(text: "추천 활동"),
                    Tab(text: "내가 만든 활동 (${customFeeds.length})"),
                  ],
                ),

                // 📌 에너지 레벨 세부 필터바가 2층으로 예쁘게 내려갑니다.
                Container(
                  height: 50,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      final isAll = index == 0;
                      final level = index - 1;
                      final isSelected = isAll
                          ? _selectedEnergyLevel == -1
                          : _selectedEnergyLevel == level;

                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text(isAll ? "전체" : "에너지 $level"),
                          selected: isSelected,
                          selectedColor: AppColors.blue2,
                          showCheckmark: false,
                          side: BorderSide.none,
                          labelStyle: TextStyle(
                            fontFamily: 'Pretendard',
                            color: isSelected
                                ? AppColors.blue8
                                : AppColors.black13,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedEnergyLevel = isAll ? -1 : level;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // 📌 3. 최종 교차 필터링된 데이터 렌더링 영역
        body: TabBarView(
          children: [
            // 🎯 첫 번째 탭 뷰: 추천 활동 목록 + 에너지 필터 적용
            _buildFilteredList(recommendedFeeds),

            // 🎯 두 번째 탭 뷰: 내가 만든 활동 목록 + 에너지 필터 적용
            _buildFilteredList(customFeeds),
          ],
        ),
      ),
    );
  }

  // 🛠️ 에너지 레벨 조건에 맞춰 리스트를 한 번 더 걸러서 카드로 그려주는 함수
  Widget _buildFilteredList(List<ActivityFeedModel> feeds) {
    // 선택된 에너지 레벨이 '전체(-1)'가 아니면 해당 레벨만 필터링
    final filtered = _selectedEnergyLevel == -1
        ? feeds
        : feeds
              .where((feed) => feed.energyLevel == _selectedEnergyLevel)
              .toList();

    if (filtered.isEmpty) {
      return const Center(
        child: Text(
          "해당 에너지 레벨의 활동이 없습니다.",
          style: TextStyle(fontFamily: 'Pretendard', color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final item = filtered[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: _buildActivityFeedCard(item),
        );
      },
    );
  }

  // 🛠️ ActivityFeed 스펙에 맞춘 고정 색상 카드 렌더링 함수
  Widget _buildActivityFeedCard(ActivityFeedModel item) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.blue1,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 📌 [파트 1] 상단 헤더 영역 (레벨 정보 + 우측 아이콘 배정)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 왼쪽: 아이콘 + 에너지 레벨 텍스트
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ), // 💡 내부 여백 설정
                decoration: BoxDecoration(
                  color: AppColors.blue6,
                  borderRadius: BorderRadius.circular(6), // 💡 모서리를 살짝 둥글게
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // 💡 Row가 내용물만큼만 크기를 가지도록 설정
                  children: [
                    SvgPicture.asset(
                      "assets/icons/arrow-up-right.svg",
                      width: 14,
                      height: 14,
                      color: AppColors.black1,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "에너지 레벨 : ${item.energyLevel}",
                      style: const TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black1,
                      ),
                    ),
                  ],
                ),
              ),
              // 오른쪽: 더보기 또는 액션 아이콘들 (보내주신 자산 매핑)
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/heart.svg", // 확장자가 .svg인지 확인해주세요!
                    width: 14,
                    height: 14,
                    // 🎨 중요: 만약 아이콘의 색상을 코드에서 직접 바꾸고 싶다면 아래 속성을 사용하세요.
                    // colorFilter: const ColorFilter.mode(AppColors.blue8, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    "assets/icons/dots-horizontal.svg", // 확장자가 .svg인지 확인해주세요!
                    width: 14,
                    height: 14,
                    // 🎨 중요: 만약 아이콘의 색상을 코드에서 직접 바꾸고 싶다면 아래 속성을 사용하세요.
                    // colorFilter: const ColorFilter.mode(AppColors.blue8, BlendMode.srcIn),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16), // 헤더와 본문 사이 간격
          // 📌 [파트 2] 수행 횟수 해시태그
          Text(
            "#${item.count}회 수행",
            style: const TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.blue8, // 강조를 위한 브랜드 서브 컬러
            ),
          ),

          const SizedBox(height: 6),

          // 📌 [파트 3] 메인 활동 타이틀
          Text(
            item.title, // 💡 "내가 제일 좋아하는 자전거길 걷기" 등이 매핑됩니다.
            style: const TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: AppColors.black13,
            ),
          ),

          const SizedBox(height: 8),

          // 📌 [파트 4] 활동 상세 설명
          Text(
            item.description, // 💡 "주변의 시각적·청각적 자극을 최소화하여..."
            style: const TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
              height: 1.4, // 줄간격을 주어 텍스트가 밀도 높을 때 가독성 확보
            ),
          ),

          // 📌 [파트 5] 하단 커스텀 해시태그 영역 (데이터에 존재하거나 고정적인 태그 렌더링)
          // 만약 goodPoint나 별도 태그 리스트가 있다면 아래처럼 가로로 렌더링해 줍니다.
          if (item.goodPoint != null || item.insight != null) ...[
            const SizedBox(height: 14),
            Wrap(
              // Row 대신 Wrap을 쓰면 태그가 길어져도 아래로 자연스럽게 넘어가서 안 깨집니다!
              spacing: 8.0, // 태그 사이 가로 간격
              runSpacing: 4.0, // 태그 줄바꿈 시 세로 간격
              children: [
                _buildMinTag("#${item.goodPoint ?? '편안함'}"),
                _buildMinTag("#스트레스완화"),
                _buildMinTag("#마음안정"),
              ],
            ),
          ],
        ],
      ),
    );
  }

  // 🏷️ 하단 미니 태그를 생성하는 가벼운 컴포넌트 메서드
  Widget _buildMinTag(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: Colors.blueGrey,
      ),
    );
  }
}
