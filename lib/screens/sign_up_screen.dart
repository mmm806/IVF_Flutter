// 회원가입 및 로그인 화면
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          //좌우 여백-> padding 위젯 추가
          padding: const EdgeInsets.symmetric(horizontal: 30.0), // 왼쪽과 오른쪽 여백 50px 추가
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // 자식 위젯을 좌우로 늘림
            children: [
              SizedBox(height: 100), // 상하 여백
              Image.asset(
                'assets/app_icon.png',
                height: 90   ,
              ),
              //카카오 소셜로그인
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  // 버튼 클릭 시 동작 정의
                  Navigator.pushNamed(context, '/profilePrompt');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFEE500), // 버튼 배경색
                  foregroundColor: Colors.black, // 버튼 텍스트 색깔
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0), // 수평 패딩 설정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // 버튼 모서리 반경
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/kakao_symbol.png',
                      height: 24.0, // 심볼의 높이 설정
                      width: 24.0, // 심볼의 너비 설정
                    ),
                    SizedBox(width: 5.0), // 이미지와 텍스트 사이 간격
                    Text(
                      '카카오 계정으로 로그인하기',
                      style: TextStyle(
                        fontSize: 16.0, // 글자 크기 설정
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 200),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/positionSelection');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFF908C8C), // 텍스트 색깔 변경
                ),
                child: Text('회원가입 없이 둘러보기',
                  style: TextStyle(
                    fontSize: 16.0, // 글자 크기 설정
                    fontFamily: 'SEOLLEIM',
                  ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
