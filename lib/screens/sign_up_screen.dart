import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
//import 'package:http/http.dart' as http;
import 'dart:convert';

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
              ElevatedButton(
                onPressed: () => _unlink(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF5F4F4),
                  foregroundColor: Color(0xFF52544C),
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 13.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  '연결 끊기',
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

  // 카카오 로그인 상태 체크
  Future<void> _checkKakaoLogin(BuildContext context) async {
    try {
      if (await AuthApi.instance.hasToken()) {
        // 이미 로그인되어 있을 경우 토큰 갱신
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
        print('현재 사용자는 카카오 로그인되어 있습니다. 액세스 토큰: ${tokenInfo.id}');
      }
      else{
        print("현재 사용자는 로그인 되어있지 않습니다.");
      }
    } catch (e) {
      print('카카오 로그인 상태가 아닙니다: $e');
    }
  }

  // 카카오 로그인 처리 함수
  Future<void> _handleKakaoLogin(BuildContext context) async {
    String? accessToken;
    try {
      // 카카오톡 설치 여부에 따라 로그인 시도
      if (await isKakaoTalkInstalled()) {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        accessToken = token.accessToken;
        print('카카오톡 로그인 성공, 액세스 토큰: $accessToken');
      } else {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        accessToken = token.accessToken;
        print('카카오 계정 로그인 성공, 액세스 토큰: $accessToken');
      }

      // 액세스 토큰을 백엔드로 전송
      //await _sendTokenToBackend(accessToken);

      // 로그인 성공 후 다음 화면으로 이동
      Navigator.pushReplacementNamed(context, '/profilePrompt');
    } catch (e) {
      print('카카오 로그인 실패: $e');
    }
  }

  //앱과 카카오 계정과의 연결끊기
  Future<void> _unlink(BuildContext context) async {
    try {
      await UserApi.instance.unlink();
      print("연결 끊기 성공");
    } catch (error) {
      print("연결 끊기 실패: $error");
    }
  }

  Future<void> _logout(BuildContext context) async {
    try {
      await UserApi.instance.logout();
      print("로그아웃 성공");
    } catch (error) {
      print("로그아웃 실패: $error");
    }
  }



// 서버로 액세스 토큰을 전달하는 함수
  // Future<void> _sendTokenToBackend(String accessToken) async {
  //   final url = 'https://your-backend-server.com/api/kakao-login'; // 백엔드 서버의 URL
  //
  //   // 요청 본문에 포함될 데이터
  //   final requestBody = jsonEncode({
  //     'accessToken': accessToken,
  //   });
  //
  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //       body: requestBody,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       print('토큰 전송 성공: ${response.body}');
  //     } else {
  //       print('토큰 전송 실패: ${response.statusCode}, ${response.body}');
  //     }
  //   } catch (e) {
  //     print('토큰 전송 오류: $e');
  //   }
  // }


  }

