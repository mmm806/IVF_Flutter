import 'package:flutter/material.dart';
import 'screens/sign_up_screen.dart';
import 'screens/profile_setup_prompt_screen.dart';
import 'screens/position_selection_screen.dart';
import 'screens/profile_setup_screen.dart';

void main() {
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

