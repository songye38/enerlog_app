import 'package:flutter/material.dart';
import 'package:enerlog_app/core/constants/app_colors.dart';

class HomeConditionSection extends StatelessWidget {
  // 🌟 외부에서는 딱 순수한 '데이터'만 주입받습니다. (색상은 내부 고정)
  final String energyLevel;   // 예: "Lv4"
  final String recoveryIndex; // 예: "+12"
  final String actionRate;     // 예: "85%"

  const HomeConditionSection({
    super.key,
    required this.energyLevel,
    required this.recoveryIndex,
    required this.actionRate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 📌 상단 전체 타이틀
        const Text(
          "최근 너의 컨디션을 간단히 정리해봤어",
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.black13,
          ),
        ),
        const SizedBox(height: 16),

        // 📊 카드 1: 최근 에너지 레벨 (🎨 파란색 계열 고정)
        _buildConditionCard(
          title: "최근 에너지 레벨",
          subtitle: "최근 3일 평균 에너지 상태",
          valueText: energyLevel,
          backgroundColor: AppColors.yellowDefault, // 👈 여기에 첫 번째 카드 색상 고정!
          onTap: () => print("에너지 레벨 대시보드 이동"),
        ),
        const SizedBox(height: 12),

        // 📊 카드 2: 회복 지수 (🎨 피그마에 정해진 두 번째 색상 고정)
        _buildConditionCard(
          title: "회복 지수",
          subtitle: "지난 3일간의 에너지 변화량",
          valueText: recoveryIndex,
          backgroundColor: AppColors.pinkDefault, // 👈 예시: 은은한 연초록색 고정
          onTap: () => print("회복 지수 대시보드 이동"),
        ),
        const SizedBox(height: 12),

        // 📊 카드 3: 행동 실행률 (🎨 피그마에 정해진 세 번째 색상 고정)
        _buildConditionCard(
          title: "행동 실행률",
          subtitle: "지난 3일간 실행 → 기록으로 이어진 비율",
          valueText: actionRate,
          backgroundColor: AppColors.skyDefault, // 👈 예시: 은은한 연주황색 고정
          onTap: () => print("행동 실행률 대시보드 이동"),
        ),
      ],
    );
  }

  // 🛠️ 공통 카드 레이아웃 빌더 함수
  Widget _buildConditionCard({
    required String title,
    required String subtitle,
    required String valueText,
    required Color backgroundColor, // 내부 빌드할 때 매핑용으로만 사용
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0), 
        decoration: BoxDecoration(
          color: backgroundColor, // 🌟 각 카드 자리에 고정된 색상이 쏙 입혀집니다.
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🏷️ 왼쪽 영역: 타이틀, 서브타이틀, 바로가기 링크
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: AppColors.black13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black13,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/Icon.png",
                        width: 10,
                        height: 10,
                        errorBuilder: (context, error, stackTrace) => 
                            const Icon(Icons.arrow_forward_ios, size: 10, color: Colors.grey),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        "대시보드에서 더 자세히 보기",
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16), 

            // ⚡ 오른쪽 영역: 주입받은 거대한 지표 수치 (예: Lv4)
            Text(
              valueText,
              style: const TextStyle(
                fontFamily: 'Outfit',
                fontSize: 61, 
                fontWeight: FontWeight.w700,
                color: AppColors.black13,
                letterSpacing: -1.5, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}