import 'package:enerlog_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap; // 💡 이름을 onPressed에서 onTap으로 변경하여 충돌을 피합니다.

  const MainButton({
    super.key,
    required this.text,
    required this.onTap, // 💡 생성자에서도 onTap으로 매칭해 줍니다.
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // 💡 InkWell의 고유 속성인 onTap에 외부에서 받은 함수를 연결합니다!
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'Outfit',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}