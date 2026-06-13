import 'package:flutter/material.dart';
import 'package:enerlog_app/core/constants/app_colors.dart';

class HomeActivityLogSection extends StatelessWidget {
  // 🌟 1. 서버에서 내려올 "미기록 활동 리스트"를 외부에서 주입받도록 변수를 선언합니다.
  final List<Map<String, String>> unrecordedActivities;

  const HomeActivityLogSection({
    super.key,
    required this.unrecordedActivities, // 🌟 필수값으로 설정
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "아직 기록하지 않은 행동이 있어",
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.black13,
          ),
        ),
        const SizedBox(height: 16),

        // 🌟 2. 주입받은 리스트가 텅 비어있을 때의 예외 처리도 해주면 좋습니다.
        if (unrecordedActivities.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "오늘 모든 활동을 완벽하게 기록하셨어요! 🎉",
              style: TextStyle(color: Colors.grey),
            ),
          )
        else
          // 🌟 3. 데이터가 있다면 주입받은 리스트의 개수만큼 카드를 그려줍니다.
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: unrecordedActivities.length,
            itemBuilder: (context, index) {
              final activity = unrecordedActivities[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: _buildActivityLogCard(
                  time: activity["time"] ?? "--:--:--", // 데이터 유실 대비 방어코드
                  title: activity["title"] ?? "알 수 없는 활동", // 데이터 유실 대비 방어코드
                  onTap: () => print("${activity["title"]} 기록하기 클릭됨"),
                ),
              );
            },
          ),
      ],
    );
  }

  // 🛠️ 내부 카드 레이아웃 빌더 (기존과 동일)
  Widget _buildActivityLogCard({
    required String time,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.blue2,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // 💡 글자 주변에 은은하게 들어갈 여백 (피그마 디자인에 맞춰 수치는 조절 가능!)
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.timeHighlight,
                borderRadius: BorderRadius.circular(
                  4.0,
                ), // 모서리를 둥글게 만들어 라벨 느낌 극대화
              ),
              child: Text(
                "기록 가능 시간 $time",
                style: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors
                      .black13, // 배경색이 어두워지면 글자색을 흰색(Colors.white) 등으로 바꿔주세요!
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // 💡 글자 주변에 숨쉴 공간(여백)을 줍니다. (좌우 8, 위아래 4 정도가 예쁩니다)
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.blue6, // 🎨 원하시는 백그라운드 색상 지정
                    borderRadius: BorderRadius.circular(
                      4.0,
                    ), // 모서리를 살짝 둥글게 (원치 않으면 삭제)
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black1,
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      "행동에 대한 기록 남기기",
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black13,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.chevron_right,
                      size: 16,
                      color: AppColors.black13,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
