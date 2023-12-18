import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
    // showTitle와 정반대의 값을 showTitle에 부여한다. (boolean)
    // setState을 해줘야 데이터가 바뀌어서 빌드 매서드를 새로 실행시켜 화면에 반영된다.
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
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('Nothing to See.'),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(
                  Icons.remove_red_eye_outlined,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Init State');
  }
  /* State를 초기화하기 위한 목적으로 쓰이는 initState.하지만 매번 사용해야만 하는 것은 아니다.
  어떤때는 이닛 스테이트 사용 필요 없이 그 밖에서 변수를 초기화해주면 그것으로 충분할 때가 있다.
  어떤 때에는 init state 안에서 변수를 초기화해주어야 할 때가 있다. 
  API의 업데이트를 따라가기 위하여 필요할 때가 있다. 
  항상 빌드 메서드 앞에 오고 딱 한번만 호출되어야 한다. 
  항상 이닛 스테이트는 빌드스테이트 앞에서 작동한다. 
   */

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  // 위젯이 화면에서 사라질 때 쓰이는 메서드
  // unsubscribe updates from API, event Listeners, Form 등. Cancel을 할 때.
  // 위젯이 아직 위젯트리에서 사라지지 않았는 데 무언가를 캔슬할 때.
  @override
  Widget build(BuildContext context) {
    print('Build');
    return Text(
      "My Large Title",
      style: TextStyle(
        color: Theme.of(context).textTheme.titleLarge!.color,
        // color: Theme.of(context).textTheme.titleLarge?.color,
        // context를 통해서 우리는 부모 부모 클래스의 정보를 가져와 적용할 수 있다.
        fontSize: 24,
      ),
    );
  }
}
