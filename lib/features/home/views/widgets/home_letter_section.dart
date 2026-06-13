import 'package:flutter/material.dart';
import 'package:enerlog_app/core/constants/app_colors.dart';

class HomeLetterSection extends StatelessWidget {
  final String date;
  final String letterContent;

  const HomeLetterSection({
    super.key,
    required this.date,
    required this.letterContent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // [파트 1] 오늘의 편지 카드 Box (동일)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: AppColors.blue1,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "💌 $date 오늘의 편지",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blue6,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                letterContent,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blue6,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              // 🌟 [파트 2] 복잡했던 버튼 영역이 한눈에 들어오게 변합니다!
              const SizedBox(height: 20),
              Row(
                children: [
                  _buildMenuButton(
                    title: "나의 에너지 레벨",
                    icon: Icons.bolt, // ⚡ 에너지 레벨에 어울리는 번개 아이콘 예시
                    onTap: () => print("에너지 레벨 클릭됨"),
                  ),
                  const SizedBox(width: 12),
                  _buildMenuButton(
                    title: "나를 채우는 활동",
                    icon: Icons.favorite, // ❤️ 활동에 어울리는 하트 아이콘 예시
                    onTap: () => print("채우는 활동 클릭됨"),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  // 🌟 String iconPath 대신 IconData icon을 받도록 수정합니다.
  Widget _buildMenuButton({
    required String title,
    required IconData icon, // 💡 여기에 아이콘 데이터를 받습니다.
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: AppColors.blue2,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🌟 Image.asset 대신 순정 Icon 위젯을 넣습니다!
              Icon(
                icon,
                size: 16, // 아이콘 크기 조절
                color: AppColors.blue8, // 아이콘 색상 조절 (디자인 테마에 맞게)
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blue8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
