// lib/features/home/views/home_screen.dart
import 'package:enerlog_app/features/home/views/widgets/home_letter_section.dart';
import 'package:enerlog_app/features/home/views/widgets/home_menu_grid_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ⚠️ Scaffold 앞의 const를 지웠습니다!
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0), // 💡 패딩값 같은 고정 수치에만 const를 붙입니다.
          child: Column(
            children: [
              // 🌟 [핵심] 여기에 매일 변하는 동적 데이터를 주입합니다.
              HomeLetterSection(
                date: "25.11.16",
                letterContent:
                    "안녕, 레나야\n오늘 너한테 필요한 건 거창한 변화가 아니라 ‘작은 회복’ 같아.\n따뜻한 물 한 잔 마시기로 시작해보는 건 어떨까?",
              ),

              // 💡 앞으로 여기에 섹션3, 섹션4, 섹션5를 순서대로 추가하시면 됩니다!
              const SizedBox(height: 32),
              // 🌟 섹션 3: 이제 이름만 던져주면 끝! 시간은 본인이 알아서 계산합니다.
              const HomeMenuGridSection(userName: "레나"),
            ],
          ),
        ),
      ),
    );
  }
}
