import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          child: Padding(
            // padding: const EdgeInsets.all(8.0), // 사방으로 8px 패딩
            // padding: const EdgeInsets.symmetric(
            //   horizontal: 8.0, // 좌우
            //   vertical: 8.0, // 싱히
            // ), // 대칭으로 8px 패딩
            // padding: EdgeInsets.only(
            //   top: 8.0,
            //   left: 8.0,
            //   right: 10.0,
            //   bottom: 2.0,
            // ), // 상하좌우 따로 커스텀
            padding: EdgeInsets.fromLTRB(32, 10, 10, 12), // 왼쪽,위쪽,오른쪽,아래
            // only는 필수 입력이 아닌데 LTRB는 모든 부분이 필수 입력임
            child: Container(color: Colors.blue, width: 50, height: 50),
          ),
        ),
      ),
    );
  }
}
