// lib/features/home/views/widgets/home_menu_grid_section.dart
import 'package:enerlog_app/features/home/data/energy_level_model.dart';
import 'package:flutter/material.dart';
import 'package:enerlog_app/core/constants/app_colors.dart';

class HomeMenuGridSection extends StatelessWidget {
  final String userName;

  const HomeMenuGridSection({super.key, required this.userName});

  // 🕒 실시간 현재 시간 구하는 함수
  String _getFormattedCurrentTime() {
    final now = DateTime.now();
    final year = now.year.toString().substring(2);
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    final second = now.second.toString().padLeft(2, '0');
    return "$year.$month.$day $hour:$minute:$second";
  }

  @override
  Widget build(BuildContext context) {
    final String timestamp = _getFormattedCurrentTime();
    final energyItems = EnergyLevelConstants.energyLevels.values.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 타이틀 영역
        Text(
          timestamp,
          style: const TextStyle(fontFamily: 'PretendardVariable', fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.black13),
        ),
        const SizedBox(height: 4),
        Text(
          "$userName야, 지금 너의 에너지는 어때?",
          style: const TextStyle(fontFamily: 'PretendardVariable', fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.black13),
        ),
        
        const SizedBox(height: 24),

        // 🌟 해결책 1: 가로 스크롤 ListView를 SizedBox로 감싸 높이를 지정해줍니다.
        // 피그마 디자인의 카드 높이에 맞춰 숫자를 140~160 사이로 조절해보세요.
        SizedBox(
          height: 150, 
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // 가로 스크롤 활성화
            // ⚠️ 가로 스크롤이 원활하게 작동하도록 shrinkWrap과 NeverScrollableScrollPhysics를 제거했습니다!
            itemCount: energyItems.length,
            itemBuilder: (context, index) {
              final item = energyItems[index];

              return Padding(
                // 🌟 해결책 2: 가로 배치가 자연스럽도록 우측(right) 간격으로 변경
                padding: const EdgeInsets.only(right: 12.0),
                child: _buildEnergyStatusButton(
                  emoji: item.emoji,
                  description: item.description,
                  scoreText: "${item.level} : ${item.title}",
                  barColor: item.barColor,
                  onTap: () => print("레벨 ${item.level} 선택됨"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // 🌟 해결책 3: 클래스 중괄호 안쪽으로 도우미 함수를 안전하게 이동시켰습니다.
  Widget _buildEnergyStatusButton({
    required String emoji,
    required String description,
    required String scoreText,
    required Color barColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        width: 162, // 이제 가로 스크롤 구조라 162 너비가 정확히 먹힙니다.
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.blue1,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 이모지와 상태 설명
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(emoji, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 8),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'PretendardVariable',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black13,
                    height: 1.4,
                  ),
                ),
              ],
            ),

            // 점수 영역
            Row(
              children: [
                Text(
                  scoreText,
                  style: const TextStyle(
                    fontFamily: 'PretendardVariable',
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
    );
  }
} // 클래스 끝나는 중괄호 위치 확인!