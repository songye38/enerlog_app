// 🌟 1. EnergyLevel을 명확하게 제한하기 위한 커스텀 타입 정의 (0 ~ 10)
// Dart는 정수 범위를 명시적으로 쪼갤 수 없으므로, 생성자 단계에서 검증(assert) 로직을 넣어 안전장치를 만듭니다.
class ActivityFeedModel {
  final String id;
  final int energyLevel;       // 0 ~ 10 범위의 에너지 레벨
  final String title;
  final String description;
  final int count;
  final String? goodPoint;       // 활동의 장점 (Optional)
  final String? insight;         // 활동의 인사이트 (Optional)
  final String? durationMinutes; // 활동에 필요한 소요시간 (Optional)

  ActivityFeedModel({
    required this.id,
    required this.energyLevel,
    required this.title,
    required this.description,
    required this.count,
    this.goodPoint,
    this.insight,
    this.durationMinutes,
  }) : assert(energyLevel >= 0 && energyLevel <= 10, '에너지 레벨은 0부터 10 사이여야 합니다.');

  // 📡 2. 나중에 서버(API)에서 JSON 데이터를 받아올 때 맵핑해 줄 생성자
  factory ActivityFeedModel.fromJson(Map<String, dynamic> json) {
    return ActivityFeedModel(
      id: json['id'] as String,
      energyLevel: json['energy_level'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      count: json['count'] as int,
      goodPoint: json['good_point'] as String?,
      insight: json['insight'] as String?,
      durationMinutes: json['durationMinutes'] as String?,
    );
  }
}