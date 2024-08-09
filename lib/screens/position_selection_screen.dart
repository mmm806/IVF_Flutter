// 직책 선택 화면 (간사 or 학생)
import 'package:flutter/material.dart';

class PositionSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {

                Navigator.pushNamed(context, '/profileSetup');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '간사\n', // 첫 번째 줄 텍스트
                      style: TextStyle(
                        fontSize: 32.0, // 첫 번째 줄 텍스트 크기
                        color: Colors.black, // 텍스트 색상
                        fontFamily: 'SEOLLEIM',
                      ),
                    ),
                    TextSpan(
                      text: ' ', // 간격을 위한 빈 텍스트 스팬 (공백 문자)
                      style: TextStyle(fontSize: 10.0), // 간격 크기를 조절하는 크기 설정
                    ),
                    TextSpan(
                      text: '프로필 설정', // 두 번째 줄 텍스트
                      style: TextStyle(
                        fontSize: 16.0, // 두 번째 줄 텍스트 크기
                        color: Colors.black, // 텍스트 색상
                        fontFamily: 'SEOLLEIM',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100), // 버튼 사이 간격
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profileSetup');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '학생\n', // 첫 번째 줄 텍스트
                      style: TextStyle(
                        fontSize: 32.0, // 첫 번째 줄 텍스트 크기
                        color: Colors.black, // 텍스트 색상
                        fontFamily: 'SEOLLEIM',
                      ),
                    ),
                    TextSpan(
                      text: ' ', // 간격을 위한 빈 텍스트 스팬 (공백 문자)
                      style: TextStyle(fontSize: 10.0), // 간격 크기를 조절하는 크기 설정
                    ),
                    TextSpan(
                      text: '프로필 설정', // 두 번째 줄 텍스트
                      style: TextStyle(
                        fontSize: 16.0, // 두 번째 줄 텍스트 크기
                        color: Colors.black, // 텍스트 색상
                        fontFamily: 'SEOLLEIM',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
