import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(
                  Icons.remove_red_eye,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;

  // initState 메소드는 build 보다 위에 있어야 하며, 오직 단 한 번만 호출된다.
  @override
  void initState() {
    super.initState();
    int count1 = 0; // 위의 초기화와 별반 다르지 않다. 대부분 위의 초기화로 충부낳다.

    // 종종 부모 요소에 의존하는 데이터를 초기화해야 하는 경우,
    // API에서 업데이트를 구독하고 싶을 때,,
    debugPrint('initState');
  }

  // dispose는 위젯이 스크린에서 제거될 때 호출되는 메서드다.
  @override
  void dispose() {
    super.dispose();
    debugPrint('dispose');
    // API 업데이트나 이벤트 리스너로부터 구독을 취소하거나
    // form의 리스너로부터 벗어나고 싶을 때 사용할 수 있다.
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
