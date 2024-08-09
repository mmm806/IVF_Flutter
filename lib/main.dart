import 'package:flutter/material.dart';
import 'package:ivf_project/screens/profile_setup_screen2.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => SignUpScreen(),
        '/profilePrompt': (context) => ProfileSetupPromptScreen(),
        '/positionSelection': (context) => PositionSelectionScreen(),
        '/profileSetup1': (context) => ProfileSetupScreen(),
        '/profileSetup2': (context) => ProfileSetupScreen2(),
      },
    );
  }
}

