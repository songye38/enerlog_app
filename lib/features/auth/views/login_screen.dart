// LoginCard를 감싸서 온전한 하나의 페이지로 보여주기 위한 Scaffold 위젯입니다.
import 'package:enerlog_app/features/auth/views/login_card.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        // 키보드가 올라올 때 화면이 깨지거나 넘치는 현상(Overflow)을 방지하기 위해 스크롤을 추가합니다.
        child: SingleChildScrollView(child: LoginCard()),
      ),
    );
  }
}