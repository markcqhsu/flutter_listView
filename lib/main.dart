import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _controller = ScrollController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onTap: () {
              // _controller.jumpTo(0.0);//這動作比較僵硬
              _controller.animateTo(
                -20.0,//小技巧，讓畫面的動作比較自然
                duration: Duration(seconds: 1),
                curve: Curves.linear,
              );
            },
            child: Text("ListView demo")),
      ),
      body: Scrollbar(
        child: ListView.builder(
          // physics: ClampingScrollPhysics(),//滾到頂上就不會動了
          // physics: BouncingScrollPhysics(),//類似iOS的滾動動作
          // physics: NeverScrollableScrollPhysics(),//禁止滾動
          physics: AlwaysScrollableScrollPhysics(),//禁止滾動
          controller: _controller,
          // padding: const EdgeInsets.all(0.0),
          padding: const EdgeInsets.only(bottom: 148),
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.person),
              title: Text("Name"),
              subtitle: Text("Subtitle"),
              trailing: IconButton(
                icon: Icon(Icons.delete_outline),
              ),
            );
            return Container(
              // height:  index % 2 == 0 ? 150: 50,
              color: index % 2 == 0 ? Colors.blue : Colors.blue[200],
            );
          },
          // scrollDirection: Axis.horizontal,//調整滾動方向
          itemCount: 200,
          itemExtent: 60,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // print(_controller.offset);
          // _controller.jumpTo(0.0);
          _controller.jumpTo(_controller.offset + 200.0);
        },
        tooltip: 'Increment',
        child: Icon(Icons.arrow_downward),
      ),
    );
  }
}
