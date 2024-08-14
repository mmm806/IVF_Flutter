import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _checkKakaoLogin(context); // 앱 실행 시 기존 토큰 체크

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 200),
              Image.asset(
                'assets/app_icon.png',
                height: 90,
              ),
              SizedBox(height: 200),
              ElevatedButton(
                onPressed: () => _handleKakaoLogin(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFEE500),
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 13.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/kakao_symbol.png',
                      height: 24.0,
                      width: 24.0,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      '카카오로 3초만에 시작하기',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profilePrompt');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF5F4F4),
                  foregroundColor: Color(0xFF52544C),
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 13.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  '회원가입 없이 둘러보기',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _checkKakaoLogin(BuildContext context) async {
    try {
      // 기존에 로그인한 사용자의 토큰이 있는지 확인
      if (await AuthApi.instance.hasToken()) {
        // 토큰이 유효한지 검사
        bool isValid = await UserApi.instance.accessTokenInfo() != null;
        if (isValid) {
          // 유효한 토큰이 있는 경우, 로그인 절차를 생략하고 다음 화면으로 이동
          Navigator.pushReplacementNamed(context, '/profilePrompt');
          return;
        }
      }
    } catch (e) {
      print('토큰 유효성 검사 실패: $e');
    }
  }

  Future<void> _handleKakaoLogin(BuildContext context) async {
    try {
      if (await isKakaoTalkInstalled()) {
        try {
          // 카카오톡 설치되어 있으면 카카오톡으로 로그인 시도
          await UserApi.instance.loginWithKakaoTalk();
        } catch (e) {
          print('카카오톡으로 로그인 실패: $e');
          // 카카오톡으로 로그인 실패 시 카카오 계정으로 로그인 시도
          await UserApi.instance.loginWithKakaoAccount();
        }
      } else {
        // 카카오톡 설치 안 되어 있으면 카카오 계정으로 로그인 시도
        await UserApi.instance.loginWithKakaoAccount();
      }

      // 로그인 성공 후 다음 화면으로 이동
      Navigator.pushReplacementNamed(context, '/profilePrompt');
    } catch (e) {
      print('카카오 로그인 실패: $e');
    }
  }
}
