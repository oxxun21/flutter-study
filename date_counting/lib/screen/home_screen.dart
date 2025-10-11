import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100], // 100~500 톤업~톤다운
      // 노치에 가리는거 방지
      body: SafeArea(
        top: true,
        bottom: false,
        left: false,
        right: false,
        child: SizedBox(
          // width: double.infinity,
          // MediaQuery.of로 실행하고 있는 앱의 넓이(또는 높이)를 알 수 있음
          // width: MediaQuery.of(context).size.width / 2 -> 화면의 반만큼
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _Top(selectedDate: selectedDate, onPressed: onHeartPressed),
              _Bottom(),
            ],
          ),
        ),
      ),
    );
  }

  void onHeartPressed() {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true, // 바깥영역 눌러서 닫힘
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              initialDateTime: selectedDate,
              maximumDate: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  selectedDate = date;
                });
              },
              dateOrder: DatePickerDateOrder.ymd, // y년 m월 d일 순서 지정
            ),
          ),
        );
      },
    );
  }
}

// 외부로 내보낼 일 없고 파일 내부에서만 쓸거면 _ 을 붙임
class _Top extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback? onPressed;

  const _Top({required this.selectedDate, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();

    return Expanded(
      child: Container(
        child: Column(
          children: [
            Text('U&I', style: textTheme.displayLarge),
            Text('우리 처음 만난 날', style: textTheme.bodyLarge),
            Text(
              '${selectedDate.year} ${selectedDate.month} ${selectedDate.day}',
              style: textTheme.bodyMedium,
            ),
            IconButton(
              onPressed: onPressed,
              icon: Icon(Icons.favorite),
              color: Colors.red,
              iconSize: 60,
            ),

            // difference 날짜 간 차이를 기간으로 가져옴
            Text(
              'D+${now.difference(selectedDate).inDays + 1}',
              style: textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(child: Image.asset('assets/img/middle_image.png')),
    );
  }
}
