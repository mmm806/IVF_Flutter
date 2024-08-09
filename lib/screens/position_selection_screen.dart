// 직책 선택 화면 (간사 or 학생)
import 'package:flutter/material.dart';

class PositionSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("직책 선택")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profileSetup1');
              },
              child: Text('학생'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profileSetup2');
              },
              child: Text('간사'),
            ),
          ],
        ),
      ),
    );
  }
}
