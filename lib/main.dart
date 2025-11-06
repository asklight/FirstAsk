import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/message_page.dart';
import 'pages/my_page.dart';
import 'pages/focus_page.dart';
import 'pages/publish_page.dart';

void main() => runApp(const MyApp());

/// App根Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget{
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  int _currentIndex = 0;

  final List<Widget> _tabPages = const[
    HomePage(),
    FocusPage(),
    PublishPage(),
    MessagePage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Tab Demo"),
      ),
      body: _tabPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: Colors.green,
        iconSize: 25,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "关注"
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.add),
            label: "发布"
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.message),
            label: "消息"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "我的"
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        }
      ),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(top:6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const[
            BoxShadow(color: Colors.black12,blurRadius: 3,offset: Offset(0, 2))
          ]
        ),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 2 ? Colors.green : Colors.blue,
          onPressed: (){
            setState(() {
              _currentIndex = 2;
            });
          },
          child: const Icon(Icons.add),
          elevation: 0,
          shape: const CircleBorder(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}

