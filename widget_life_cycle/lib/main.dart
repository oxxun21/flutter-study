import 'dart:developer' as console;

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: PracticeWidget()));
}

class LessScreen extends StatelessWidget {
  const LessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LessWidget());
  }
}

class LessWidget extends StatelessWidget {
  LessWidget({super.key}) {
    print('--생성자--');
  }

  @override
  Widget build(BuildContext context) {
    print('--빌드--');
    return Container(width: 50, height: 50, color: Colors.red);
  }
}
// result
// I/flutter (26286): --생성자--
// I/flutter (26286): --빌드--

class StateWidget extends StatefulWidget {
  const StateWidget({super.key});

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

// Stateful Widget
// 1. Constructor()
// 2. createState()
// - 무조건 정의 -> state 클래스 생성를 의미

class _StateWidgetState extends State<StateWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// State Class
// 3. initState()
// - state 클래스가 init 됐을때 딱 한번 실행
// - init state는 컨텍스트를 사용할 수 없음
// 4. didChangeDependencies()
// - 컨텍스트 제공
// - state 클래스가 가지고 있는 의존성이 변경됐을 때 다시 실행
// 5. dirty
// - dirty, clean은 state 클래스의 상태를 의미함 (개발자가 직접 사용 X, 이론적 의미)
// - 빌드가 실행 되어야 하는 상태
// 6. build()
// 7. clean
// - 빌드가 실행된 후의 상태
// 8. deactivate()
// - state가 삭제될 때 실행
// 9. dispose()

// setState가 추가된 경우
// clean -> setState() -> dirty -> build() -> clean 순
// 변경된 상태가 반영되는 구간은 setState -> dirty 사이가 됨

// 자식 위젯의 파라미터로 상태 변경을 한 경우 (props 전달 개념)
// clean -> 자식 위젯의 재생성(Stateful Widget: Constructor()) -> State Class에서 didUpdateWidget() -> dirty -> build() -> clean
// create는 다시 실행하지 않고 기존의 사용하던 state를 찾아서 변경된 인스턴스나 상태를 가지고 didUpdateWidget 호출

class PracticeWidget extends StatefulWidget {
  PracticeWidget({super.key}) {
    console.log('1) stateful widget constructor');
  }

  @override
  State<PracticeWidget> createState() {
    // createState는 순수 state인스턴스만 반환해야하기 때문에 경고 생기는 거
    console.log('2) statefule widget create state');
    return _PracticeWidgetState();
  }
}

class _PracticeWidgetState extends State<PracticeWidget> {
  // 상속받아서 이미 존재하지만 로그를 위해 꺼내오기
  @override
  void initState() {
    console.log('3) stateful widget initstate');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    console.log('4) stateful widget didChangeDependencies');
    super.didChangeDependencies();
  }

  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    console.log('5) build');
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  color = color == Colors.red ? Colors.blue : Colors.red;
                });
              },
              child: Container(width: 50, height: 50, color: color),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // setState(() {
                //   show = !show;
                // });
              },
              child: Text('show/hide'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    console.log('6) stateful widget deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    console.log('7) stateful widget dispose');
    super.dispose();
  }
}

// initState : useEffect(() => {}, [])
// dispose : useEffect(() => { return () => {} }, [])의 cleanup
// didChangeDependencies : context 변경 감지
