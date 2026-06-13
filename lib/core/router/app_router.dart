import 'package:enerlog_app/features/auth/views/login_screen.dart';
import 'package:enerlog_app/features/auth/views/register_screen.dart';
import 'package:enerlog_app/features/home/views/home_screen.dart'; 
// 🌟 ActsScreen 임포트 추가
import 'package:enerlog_app/features/acts/views/acts_screen.dart'; 
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static const String login = '/login'; 
  static const String register = '/register';
  static const String home = '/';       
  static const String acts = 'acts'; // 🌟 하위 경로용 주소 이름 추가 (앞에 / 를 빼고 적습니다)

  static final GoRouter router = GoRouter(
    initialLocation: home, 
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
        // 🌟 home 하위에 routes를 열어 acts 주소를 엮어줍니다.
        routes: [
          GoRoute(
            path: acts, // 결과 주소: '/acts'
            builder: (context, state) => const ActsScreen(),
          ),
        ],
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