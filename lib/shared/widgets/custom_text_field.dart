import 'package:enerlog_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label; // "이메일", "비밀번호" 같은 상단 라벨
  final String hintText; // 입력창 안의 힌트 문구
  final bool isObscure; // 비밀번호 숨김 여부 (기본값 false)
  final TextEditingController? controller; // 입력값을 제어할 컨트롤러 (선택)

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.isObscure = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 라벨과 인풋창을 왼쪽 정렬
      children: [
        // 1. 라벨 텍스트 (피그마의 w600, 14사이즈 반영)
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'PretendardVariable',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.black13,
          ),
        ),
        const SizedBox(height: 8), // 라벨과 인풋창 사이의 간격
        // 2. 실제 입력 가능한 폼 필드
        TextFormField(
          controller: controller,
          obscureText: isObscure,
          // 가변 폰트가 적용된 입력 글자 스타일
          style: const TextStyle(
            fontFamily: 'PretendardVariable',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.black13,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.blue3, // 보통 힌트는 약간 흐린 컬러로 잡습니다
              fontSize: 16,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 14.0,
            ),

            // 🌟 1. 배경색을 채우겠다는 활성화 스위치
            filled: true,
            // 🌟 2. 채우고 싶은 배경 컬러 지정 (예: 피그마에 등록된 그레이나 라이트 블루 스케일)
            fillColor: AppColors.blue1, // 혹은 원하시는 배경색 변수명 입력
            // 🌟 3. 기본 테두리선 스타일 정의 (배경색이 있으므로 borderSide를 없애거나 연하게 처리)
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none, // 테두리 선 없이 배경색만 깔끔하게 떨어지게 하려면 none
            ),

            // 💡 터치하기 전 기본 상태의 스타일
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),

            // 💡 마우스 커서나 터치로 포커스 되었을 때 테두리 스타일
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
