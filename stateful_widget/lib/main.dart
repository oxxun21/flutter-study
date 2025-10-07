import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomeScreen()));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    print('build 실행!');

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                if (color == Colors.blue) {
                  color = Colors.red;
                } else {
                  color = Colors.blue;
                }

                print('색상 변경: color: $color');

                setState(() {});
              },
              child: Text('색상 변경!'),
            ),
            SizedBox(height: 32.0),
            Container(width: 50.0, height: 50.0, color: color),
          ],
        ),
      ),
    );
  }
}

// stanim -> StatefulWidget 스니펫
// stless -> StatelessWidget 스니펫

// StatefulWidget
// State를 상속받게 되면 setState 사용 가능
// setState(() {}); -> 빌드 함수를 다시 실행하라는 명령어
