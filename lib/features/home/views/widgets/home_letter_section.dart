import 'package:flutter/material.dart';
import 'package:enerlog_app/core/constants/app_colors.dart';
import 'package:go_router/go_router.dart'; // 🌟 GoRouter 직접 임포트!

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
              const SizedBox(height: 20),
              Row(
                children: [
                  // ⚡ 1. 나의 에너지 레벨 버튼
                  _buildMenuButton(
                    title: "나의 에너지 레벨",
                    icon: Icons.bolt,
                    // 🌟 내부에서 직접 주소를 쏴줍니다. (에너지 주소에 맞게 변경 가능)
                    onTap: () => context.push('/energy-level'), 
                  ),
                  const SizedBox(width: 12),
                  
                  // ❤️ 2. 나를 채우는 활동 버튼
                  _buildMenuButton(
                    title: "나를 채우는 활동",
                    icon: Icons.favorite,
                    // 🌟 아까 라우터에 세팅한 '/acts' 주소로 직접 이동!
                    onTap: () => context.push('/acts'), 
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

  // 버튼 레이아웃 빌더는 동일
  Widget _buildMenuButton({
    required String title,
    required IconData icon,
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
              Icon(icon, size: 16, color: AppColors.blue8),
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