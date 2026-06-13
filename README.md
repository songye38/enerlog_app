lib/
├── main.dart               # 앱의 진입점 (가장 먼저 실행되는 파일)
├── app.dart                # MaterialApp 설정, 전역 테마, 라우팅 정의
│
├── core/                   # 앱 전체에서 공통으로 쓰는 베이스 코드
│   ├── constants/          # 디자인 시스템 (색상 상수, 폰트 스타일 등)
│   ├── theme/              # Light / Dark 모드 등 테마 설정
│   ├── network/            # API 통신 클라이언트 (Dio 등 설정)
│   └── utils/              # 포맷터, 공통 헬퍼 함수
│
├── features/               # 기능별 폴더 (앱의 핵심)
│   ├── auth/               # 1. 인증 기능 (로그인, 회원가입)
│   │   ├── data/           # API 요청, 데이터 파싱 (Data Source, Model)
│   │   ├── controllers/    # 상태 관리 및 비즈니스 로직 (Provider, Bloc 등)
│   │   └── views/          # 화면 UI (LoginScreen, Widgets)
│   │
│   ├── home/               # 2. 메인 홈 기능
│   │   ├── data/
│   │   ├── controllers/
│   │   └── views/
│   │
│   └── profile/            # 3. 마이페이지 기능
│       ├── data/
│       ├── controllers/
│       └── views/
│
└── shared/                 # 여러 기능에서 돌려쓰는 공통 컴포넌트
    └── widgets/            # 커스텀 버튼, 공통 인풋창, 로딩 바 등