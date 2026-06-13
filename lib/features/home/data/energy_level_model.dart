import 'package:flutter/material.dart';

// 🌟 TypeScript의 EnergyLevel 타입 정의를 int로 대응합니다.
// 💡 값을 0~10으로 제한하는 검증 로직을 클래스 내부에 녹여낼 수 있습니다.
class EnergyLevelInfo {
  final int level;          // export type EnergyLevel = 0 | 1 | ... | 10;
  final String title;
  final String emoji;
  final String description;
  final Color barColor;     // 게이지 바 색상도 레벨별로 다르게 지정할 수 있게 추가!

  const EnergyLevelInfo({
    required this.level,
    required this.title,
    required this.emoji,
    required this.description,
    required this.barColor,
  });
}

// 🌟 TypeScript의 ENERGY_LEVELS 상수를 Dart의 고정 Map(Record 대체)으로 정의합니다.
class EnergyLevelConstants {
  EnergyLevelConstants._(); // 인스턴스화 방지

  static const Map<int, EnergyLevelInfo> energyLevels = {
    0: EnergyLevelInfo(
      level: 0,
      title: "완전 방전",
      emoji: '🫥',
      description: "몸이 완전히 굳은 느낌이고, 일어나는 것도 벅찰 정도로 에너지가 바닥났어.",
      barColor: Colors.red,
    ),
    1: EnergyLevelInfo(
      level: 1,
      title: "생존모드",
      emoji: '😶‍🌫️',
      description: "몸이 너무너무 무겁고, 움직이는 것 자체가 너무 힘들어.",
      barColor: Colors.orange,
    ),
    2: EnergyLevelInfo(
      level: 2,
      title: "무기력",
      emoji: '🥀',
      description: "몸이 전반적으로 처져 있고 힘이 없지만, 움직이려면 할 수는 있는 정도야.",
      barColor: Colors.orangeAccent,
    ),
    3: EnergyLevelInfo(
      level: 3,
      title: "느린 회복",
      emoji: '🌫️',
      description: "몸이 조금씩 풀리긴 하는데 여전히 피곤해서 오래 집중하긴 어려워.",
      barColor: Colors.amber,
    ),
    4: EnergyLevelInfo(
      level: 4,
      title: "기본 유지",
      emoji: '🙂',
      description: "피곤하긴 한데 “아 오늘은 그래도 움직일 순 있겠다” 싶은 정도.",
      barColor: Colors.yellow,
    ),
    5: EnergyLevelInfo(
      level: 5,
      title: "안정 상태",
      emoji: '🙂',
      description: "몸 상태는 무난하고 피로감도 좀 덜하며, 가벼운 활력과 집중력도 느껴져",
      barColor: Colors.lightGreenAccent,
    ),
    6: EnergyLevelInfo(
      level: 6,
      title: "활동 가능",
      emoji: '🚶‍',
      description: "몸이 비교적 가볍고 상쾌하며, 가벼운 운동이나 외출도 괜찮아요.",
      barColor: Colors.lightGreen,
    ),
    7: EnergyLevelInfo(
      level: 7,
      title: "충전 완료",
      emoji: '🌤️',
      description: "몸이 비교적 가볍고 상쾌하며, 가벼운 운동이나 외출도 괜찮아요.",
      barColor: Colors.greenAccent,
    ),
    8: EnergyLevelInfo(
      level: 8,
      title: "에너지 부스트",
      emoji: '⚡️',
      description: "체력도 좋고, 활동량을 늘려도 무리 없이 버틸 수 있어",
      barColor: Colors.green,
    ),
    9: EnergyLevelInfo(
      level: 9,
      title: "최고의 컨디션",
      emoji: '🔥',
      description: "몸이 너무 가볍고, 움직일수록 에너지가 더 나는 느낌!",
      barColor: Colors.blueAccent,
    ),
    10: EnergyLevelInfo(
      level: 10,
      title: "슈퍼모드",
      emoji: '🌟',
      description: "거의 완벽에 가까운 몸 상태, 오래 집중하고 오래 움직여도 끄떡없어.",
      barColor: Colors.purpleAccent,
    ),
  };
}