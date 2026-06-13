import 'package:enerlog_app/features/auth/views/login_screen.dart';
import 'package:enerlog_app/features/auth/views/register_screen.dart';
// 🌟 1. 홈 화면 파일을 import 해줍니다.
import 'package:enerlog_app/features/home/views/home_screen.dart'; 
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  // 화면들의 주소(경로) 이름 상수에 'home'을 추가합니다.
  static const String login = '/login'; // 💡 기존 '/' 였던 로그인 주소를 옮겨둡니다.
  static const String register = '/register';
  static const String home = '/';       // 💡 기본 주소('/')를 홈 화면으로 지정합니다.

  // GoRouter 핵심 설정
  static final GoRouter router = GoRouter(
    // 🌟 2. 앱이 켜졌을 때 처음 보여줄 주소를 'home'('/')으로 변경합니다!
    initialLocation: home, 
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(), // 🌟 첫 화면에 홈 화면 매핑
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
}