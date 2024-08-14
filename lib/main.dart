import 'package:flutter/material.dart';
import 'screens/sign_up_screen.dart';
import 'screens/profile_setup_prompt_screen.dart';
import 'screens/position_selection_screen.dart';
import 'screens/profile_setup_screen.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';


void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: "9676b91eacc98215fd88dd534e40badc",
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // DEBUG 플래그 삭제
      themeMode: ThemeMode.light, // 항상 밝은 테마 사용
      initialRoute: '/',
      routes: {
        '/': (context) => SignUpScreen(),
        '/profilePrompt': (context) => ProfileSetupPromptScreen(),
        '/positionSelection': (context) => PositionSelectionScreen(),
        '/profileSetup': (context) => ProfileSetupScreen(),
      },
    );
  }
}

