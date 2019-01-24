import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterApp',
      theme: ThemeData(
        primarySwatch: Colors.blue, //主题颜色
      ),
      home: MyHomePage(title: 'Flutter Demo练习'), //标题
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
  int _selectedIndex = 0;

  //方法
  void _onItemTapped(int index) {
    setState(() {
      //刷新UI
      _selectedIndex = index;
    });
  }

  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 12,
        centerTitle: true, //title 文字居中
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('主页')),
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('消息')),
          BottomNavigationBarItem(icon: Icon(Icons.adb), title: Text('我的')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
      body: new Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  final _widgetOptions = [
    new ListView.builder(
      padding: EdgeInsets.all(14.0),
      itemBuilder: (BuildContext context, int index) {
//        return GestureDetector(
//          child: Text('Index $index:Home'),
//          onTap: () {
//            print(index);
//          },
//        );
        return GestureDetector(
            onTap: () {
              //item监听。打印监听
              print('列表Item监听，点中第----$index----项');
            },
            child: new Container(
              margin: EdgeInsets.all(4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      "http://pic2.16pic"
                          ".com/00/10/77/16pic_1077775_b.jpg",
                      width: 246,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: new EdgeInsets.fromLTRB(2.0, 0.0, 10.0, 0.0),
                      height: 150.0,
                      child: Stack(
                        children: <Widget>[
                          new Container(
                            child: new Text("清纯小妹",
                                style: new TextStyle(fontSize: 25.0,color:
                                Colors.red)),
                            alignment: FractionalOffset.topLeft,
                          ),
                          new Container(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 50,
                                0, 0),
                            child: new Text("美丽动人的妹子,赶紧抱一个回去",
                                style: new TextStyle(fontSize: 20.0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
//      itemBuilder: (BuildContext context, int index) {
//        return Text('Index $index:Home');
//      },
      itemCount: 60,
    ),
    //children: formImgsColorBlendMode()
    Wrap(
      children: <Widget>[
        Image.network('http://pic2.16pic.com/00/10/77/16pic_1077775_b.jpg'),
        Center(child: Text('绝域从军计惘然，')),
        Center(child: Text('东南幽恨满词笺。')),
        Center(child: Text('一箫一剑平生意，')),
        Center(child: Text('负尽狂名十五年。')),
      ],
    ),
    Image.network('http://pic2.16pic.com/00/10/77/16pic_1077775_b.jpg'),
  ];
}
