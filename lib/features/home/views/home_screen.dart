// lib/features/home/views/home_screen.dart
import 'package:enerlog_app/features/home/views/widgets/home_activity_log_section.dart';
import 'package:enerlog_app/features/home/views/widgets/home_condition_section.dart';
import 'package:enerlog_app/features/home/views/widgets/home_letter_section.dart';
import 'package:enerlog_app/features/home/views/widgets/home_menu_grid_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> mockServerData = [
      {"time": "10:08:08", "title": "가벼운 산책"},
      {"time": "14:25:00", "title": "카페에서 개발 공부"},
      {"time": "19:40:12", "title": "저녁 러닝"},
    ];

    const String currentEnergyLevel = "Lv4";
    const String currentRecoveryIndex = "+15";
    const String currentActionRate = "82%";

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

              const SizedBox(height: 32),

              // 🌟 섹션 4: 서버에서 왔다고 가정하고 데이터를 주입합니다!
              HomeActivityLogSection(unrecordedActivities: mockServerData),

              const SizedBox(height: 32),

              // 🌟 섹션 5: 컨디션 리포트 대시보드 영역 연결 및 데이터 주입!
              const HomeConditionSection(
                energyLevel: currentEnergyLevel,
                recoveryIndex: currentRecoveryIndex,
                actionRate: currentActionRate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
