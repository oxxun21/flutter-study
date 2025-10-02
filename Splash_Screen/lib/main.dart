import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Homescreen(),
    ),
  );
}

// stless -> StatelessWidget 위젯 자동 완성
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }


// StatelessWidget
// 빌드 합수가 존재 해야함
// 컴포넌트 분리 걔념
class Homescreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF335CB0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/logo.png'),
            SizedBox(height: 28), // 간격을 gap이 아니라 이렇게 주네
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      )
    );
  }
}

// statelessWidget으로 컴포넌트들을 만들어서 main에 넣게 되면 hotreload 안하고 저장 만으로도 화면 변경 확인 가능
// 위젯 위에 커서 두고 **alt + enter** -> remove this widget 하면 지우고 싶은 위젯을 정리해줌
// 상위에 위젯 생성 등 가능