import 'package:flutter/material.dart';

class ProfileSetupScreen2 extends StatefulWidget {
  @override
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen2> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상단의 뒤로가기 버튼을 직접 구현
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context); // 뒤로가기 버튼 클릭 시 화면을 닫음
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 8.0), // 앱바 아래 간격 조정
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      alignment: Alignment.center, // Stack의 중앙 정렬
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[200],
                          child: CircleAvatar(
                            radius: 48,
                          ),
                        ),
                        Positioned(
                          bottom: 0, // Positioned 위젯의 bottom을 0으로 설정하여 동일한 높이로 맞춤
                          right: 0, // Positioned 위젯의 right을 0으로 설정하여 오른쪽 아래에 배치
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.camera_alt, size: 16, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  SizedBox(
                    width: 200.0, // 원하는 가로 길이로 조정
                    height: 30.0,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center, // 텍스트를 수직 중앙으로 정렬
                      decoration: InputDecoration(
                        hintText: '닉네임을 입력하세요.',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 28.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    width: 310.0, // 원하는 가로 길이로 조정
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 240), // 원하는 여백 조정
                    child: Text('아베퍼정보', style: TextStyle(fontSize: 15)),
                  ),

                  SizedBox(height: 15.0),
                  SizedBox(
                    width: 320.0, // 원하는 가로 길이로 조정
                    height: 40.0,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '이름(실명)을 입력하세요. (ex) 홍길동',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0, // 힌트 텍스트의 크기를 줄임
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    width: 320.0, // 원하는 가로 길이로 조정
                    height: 40.0,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: '담당 학교',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
                      ),
                      items: ['학교1', '학교2', '학교3']
                          .map((school) => DropdownMenuItem(
                        value: school,
                        child: Text(school),
                      ))
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),

                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 150.0, 0, 0), // 왼쪽 20, 아래 50 여백 추가
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (newValue) {
                              setState(() {
                                _isChecked = newValue!;
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                              '개인정보 수집에 동의합니다',
                              style: TextStyle(fontSize: 12), // 텍스트 크기를 작게 설정
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 1.0), // 버튼을 더 아래로 내리기 위해 간격 조정
                  SizedBox(
                    width: 320.0, // 원하는 가로 길이로 조정
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add profile setup functionality if needed
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        '프로필 설정하기',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // 텍스트 색상을 흰색으로 설정
                        ),
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
