import 'package:enerlog_app/core/constants/app_colors.dart';
import 'package:enerlog_app/shared/widgets/custom_text_field.dart';
import 'package:enerlog_app/shared/widgets/main_button.dart';
import 'package:flutter/material.dart';

class SigninCard extends StatelessWidget {
  const SigninCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. 헤더 영역 (타이틀 & 슬로건)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Enerlog",
                style: TextStyle(
                  fontFamily: 'WagleWagle',
                  fontSize: 84,
                  height: 1.1,
                  color: AppColors.blue6,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "capturing energy,\nguiding recovery,\nempowering youth",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Outfil',
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue6,
                ),
              ),
            ],
          ),
          const SizedBox(height: 48), // 영역 간 간격
          // 2. 입력 필드 영역 (이메일 & 비밀번호)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(label: "이메일", hintText: "이메일을 입력해 주세요."),

              const SizedBox(height: 16), // 인풋창 사이 간격

              CustomTextField(label: "닉네임", hintText: "닉네임을 입력해 주세요."),

              const SizedBox(height: 16), // 인풋창 사이 간격
              // 2. 비밀번호 입력창 (isObscure를 true로 주면 가려집니다)
              CustomTextField(
                label: "비밀번호",
                hintText: "비밀번호를 입력해 주세요.",
                isObscure: true,
              ),

              const SizedBox(height: 16), // 인풋창 사이 간격
              CustomTextField(
                label: "비밀번호 확인",
                hintText: "비밀번호를 다시 입력해 주세요.",
                isObscure: true,
              ),

              const SizedBox(height: 24),
            ],
          ),
          const SizedBox(height: 8),

          // 3. 에러 메시지 영역
          Text(
            "비밀번호가 일치하지 않습니다.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.red[400], // 에러 지표 시각화
            ),
          ),
          const SizedBox(height: 24),

          MainButton(
            text: "회원가입",
            onTap: () {
              // 💡 onPressed: 대신 onTap: 으로 작성!
              print("로그인 버튼이 클릭되었습니다.");
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
