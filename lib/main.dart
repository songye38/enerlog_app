import 'package:enerlog_app/core/router/app_router.dart';
import 'package:flutter/material.dart';
// 💡 중요: login_card.dart가 생성된 실제 폴더 경로에 맞게 패키지 import명을 확인해 주세요.
// 만약 features/auth/views/widgets/ 폴더에 만드셨다면 아래와 같이 연결됩니다.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Enerlog',
      debugShowCheckedModeBanner: false, // 우측 상단 디버그 리본 숨기기
      theme: ThemeData(
        useMaterial3: true,
        // 폰트 패밀리를 아예 앱 전체 기본값으로 지정!
        fontFamily: 'PretendardVariable',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      routerConfig: AppRouter.router,
    );
  }
}


