import 'package:flutter/material.dart';

class ProfileSetupPromptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/babsae_student.png', // 사용할 이미지 경로
            //   height: 100,
            // ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 50), // 컨테이너 내부 여백
              decoration: BoxDecoration(
                color: Colors.grey[200], // 컨테이너 배경색 0xFFF9F9F9로 하니 연두색이 나와서 grey에서 색조정
                borderRadius: BorderRadius.circular(12), // 테두리 반경
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // 그림자 색상 (살짝 어두운 색)
                    offset: Offset(0, 4), // 그림자의 오프셋 (수평, 수직)
                    blurRadius: 4.0, // 그림자의 흐림 정도
                    spreadRadius: 0.0, // 그림자의 확산 정도
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '동뱁 가입을 환영합니다!\n원활한 서비스 이용을 위해\n프로필 설정과 아벱퍼인증을\n해주세요.',
                    style: TextStyle(
                      color: Colors.black, // 텍스트 색깔
                      fontSize: 16.0, // 텍스트 크기
                      height: 2, // 줄 간격
                      fontFamily: 'SEOLLEIM',
                    ),
                    textAlign: TextAlign.center, // 텍스트 중앙 정렬
                  ),
                  SizedBox(height: 40), // 텍스트와 버튼 간의 간격
                  ElevatedButton(
                    onPressed: () {
                      // 버튼 클릭 시 동작 정의
                      Navigator.pushNamed(context, '/positionSelection');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF65A85A), // 버튼 배경색
                      foregroundColor: Colors.white, // 버튼 텍스트 색깔
                      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // 버튼 모서리 반경
                      ),
                    ),
                    child: Text('프로필 설정 시작하기',
                      style: TextStyle(
                        fontFamily: 'SEOLLEIM',
                      ),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
