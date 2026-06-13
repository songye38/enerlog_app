import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ==========================================
  // 1. Primitive Palette (원시 스케일 / 기초 자산)
  // ==========================================
  // Blue 스케일 (1부터 10까지 피그마 HEX 코드를 적어주세요)
  static const Color blue1  = Color(0xFFECEFF9); 
  static const Color blue2  = Color(0xFFD2D8F1);
  static const Color blue3  = Color(0xFFAFB9E6);
  static const Color blue4  = Color(0xFF8A98DA);
  static const Color blue5  = Color(0xFF6679CF);
  static const Color blue6  = Color(0xFF455CC5); // 만약 이게 메인이라면 기준점
  static const Color blue7  = Color(0xFF3B4EA7);
  static const Color blue8  = Color(0xFF31418C);
  static const Color blue9  = Color(0xFF273470);
  static const Color blue10 = Color(0xFF1F2959);

  // Black & Gray 스케일
  static const Color black1 = Color(0xFFFFFFFF);
  static const Color black2 = Color(0xFFFCFCFC);
  static const Color black3 = Color(0xFFF5F5F5);
  static const Color black4 = Color(0xFFF0F0F0);
  static const Color black5 = Color(0xFFD9D9D9);
  static const Color black6 = Color(0xFFBFBFBF);
  static const Color black7 = Color(0xFF8C8C8C);
  static const Color black8 = Color(0xFF595959);
  static const Color black9 = Color(0xFF454545);
  static const Color black10 = Color(0xFF262626);
  static const Color black11 = Color(0xFF1F1F1F);
  static const Color black12 = Color(0xFF141414);
  static const Color black13 = Color(0xFF000000);


  // Secondary 스케일 (피그마에 지정된 서브 컬러 스케일)
  static const Color yellowDefault = Color(0xFFF2EDBA);
  static const Color yellowHighlight  = Color(0xFF98935E);
  static const Color pinkDefault  = Color(0xFFF2BAE9);
  static const Color pinkHighlight  = Color(0xFF803773);
  static const Color skyDefault  = Color(0xFF95E2EE);
  static const Color redDefault  = Color(0xFFED1515);
  static const Color timeHighlight  = Color(0xFFFFF34F);

  // ==========================================
  // 2. Semantic Colors (의미 기반 매핑 / 실제 쓸 이름)
  // ==========================================
  // 역할을 기준으로 위에서 만든 원시 스케일을 연결해 줍니다.
  
  // 브랜드 주요 컬러
  static const Color primary = blue6;                // 서비스 주축 컬러
  //static const Color secondary = secondaryMain;      // 서브 포인트 컬러
  
  // UI 요소별 컬러
  //static const Color background = white;
  //static const Color surface = blue1;                // 옅은 블루 배경 카드 등
  
  // 텍스트 및 경계선
  // static const Color textPrimary = black;            // 기본 중요한 글씨
  // static const Color textSecondary = gray4;          // 슬로건, 설명 등 흐린 글씨
  // static const Color border = gray2;                 // 인풋창 테두리

  // 기능별 (필요시 추가)
  //static const Color error = Color(0xFFDF4747);
}