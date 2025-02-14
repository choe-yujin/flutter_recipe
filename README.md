# Recipe App
> 레시피 검색 및 북마크 기능을 제공하는 Flutter 앱

[![Flutter](https://img.shields.io/badge/Flutter-3.6.2-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0.0-0175C2?logo=dart)](https://dart.dev)

## 📱 프로젝트 개요
- **프로젝트**: Flutter Recipe App
- **GitHub**: [https://github.com/choe-yujin/flutter_recipe](https://github.com/choe-yujin/flutter_recipe)
- **개발 기간**: 2024.02.09 ~ 2024.02.16 (1주)

## 🎯 서비스 개요
레시피를 검색하고 북마크할 수 있는 모바일 앱으로, 요리에 관심 있는 사용자들이 쉽게 레시피를 찾고 저장할 수 있습니다.

## 🛠 사용 기술
- **Language**: Dart
- **Framework**: Flutter
- **Architecture**: Clean Architecture, MVVM
- **State Management**: ChangeNotifier, ListenableBuilder
- **Navigation**: go_router
- **Libraries**:
- freezed_annotation: 상태 관리를 위한 불변 객체 생성
- go_router: 네비게이션 처리

## 💡 핵심 기능
1. **레시피 검색**
- 실시간 검색 기능
- 최근 검색 결과 표시
- 검색 필터링 (시간, 평점)

2. **북마크 기능**
- 레시피 저장 및 관리
- 저장된 레시피 목록 표시

3. **UI/UX**
- 직관적인 그리드 레이아웃
- 반응형 검색 필드
- 로딩 상태 표시

## 👩‍💻 역할 및 기여 내용
1. **클린 아키텍처 설계 및 구현**
- Domain, Data, Presentation 계층 분리
- Repository 패턴 적용
- UseCase 기반 비즈니스 로직 구현

2. **MVVM 패턴 적용**
- ViewModel을 통한 상태 관리
- UI와 비즈니스 로직 분리
- 단방향 데이터 흐름 구현

3. **컴포넌트 설계**
- 재사용 가능한 UI 컴포넌트 개발
- 일관된 디자인 시스템 적용

## 🎉 성과 및 느낀점
### 성과
- 클린 아키텍처와 MVVM 패턴을 적용한 확장 가능한 코드베이스 구축
- 재사용 가능한 컴포넌트 설계로 개발 생산성 향상
- 상태 관리 로직 분리로 테스트 용이성 확보

### 느낀점
- 클린 아키텍처를 적용하며 계층 분리의 중요성 체감
- MVVM 패턴을 통한 상태 관리의 장점 경험
- Flutter의 위젯 시스템과 상태 관리에 대한 이해도 향상

## 📝 프로젝트 구조
```
lib/
├── core/              # 공통 유틸리티 및 상수
├── data/             # 데이터 계층
│   ├── data_source/  # 데이터 소스
│   └── repository/   # 레포지토리 구현체
├── domain/           # 도메인 계층
│   ├── model/        # 도메인 모델
│   ├── repository/   # 레포지토리 인터페이스
│   └── use_case/     # 유스케이스
└── presentation/     # 프레젠테이션 계층
├── components/   # 재사용 컴포넌트
└── screens/      # 화면 구현
```

---
## 🔗 참고자료
- [플러터 앱을 테스트 하는 방법 유닛, 위젯, 통합테스트](https://codelabs.developers.google.com/codelabs/flutter-app-testing?hl=ko#0)
- [이슈 적용 참고 프로젝트](https://github.com/orgs/teamterning/projects/1/views/1)
- [디자인시스템](https://teamterning.github.io/Terning-Android/index.html)
- [안드로이드 스타일 가이드(헤이딜러팀)](https://github.com/PRNDcompany/android-style-guide?tab=readme-ov-file)
- [안드로이드스튜디오 IDE 라이브 템플릿](https://www.notion.so/579bac3070754bdf8fa10afe4ebe8c92?pvs=21)
- [파일 합쳐 보이게 하기](https://velog.io/@jsoh/Flutter-g.dart-%ED%8C%8C%EC%9D%BC-%ED%95%A9%EC%B3%90-%EB%B3%B4%EC%9D%B4%EA%B2%8C-%ED%95%98%EA%B8%B0)