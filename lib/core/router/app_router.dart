import 'package:enerlog_app/features/auth/views/login_screen.dart';
import 'package:enerlog_app/features/auth/views/register_screen.dart';
import 'package:go_router/go_router.dart';
// 💡 이동할 화면(Screen/Page)들을 import 합니다.

class AppRouter {
  AppRouter._();

  // 1. 화면들의 주소(경로) 이름을 상수로 깔끔하게 정의
  static const String login = '/';
  static const String register = '/register';

  // 2. GoRouter 핵심 설정 고정
  static final GoRouter router = GoRouter(
    initialLocation: login, // 앱이 켜졌을 때 처음 보여줄 주소
    routes: [
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterScreen(), // 회원가입 페이지 연결
      ),
    ],
  );
}