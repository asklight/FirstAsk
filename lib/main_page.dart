// lib/main_page.dart
import 'package:flutter/material.dart';
import 'pages/message_page.dart';
import 'pages/profile_page.dart';
import 'pages/mini_program_page.dart';
import 'pages/home_page.dart';
import 'pages/focus_page.dart';
import 'pages/publish_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const FocusPage(),
    Container(), // 占位符，对应加号按钮
    const MessagePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomNavItem(Icons.home, "主页", 0),
          _buildBottomNavItem(Icons.favorite, "关注", 1),
          _buildPlusButton(), // 加号按钮
          _buildBottomNavItem(Icons.message, "消息", 3),
          _buildBottomNavItem(Icons.person, "我的", 4),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: _currentIndex == index
                  ? Colors.blue.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.1),
              shape: BoxShape.circle,
              border: _currentIndex == index
                  ? Border.all(color: Colors.blue, width: 2)
                  : null,
            ),
            child: Icon(
                icon,
                color: _currentIndex == index ? Colors.blue : Colors.grey,
                size: 24
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: _currentIndex == index ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlusButton() {
    return GestureDetector(
      onTap: () {
        // 这里可以添加加号按钮的功能，例如弹出菜单
        _showPlusMenu(context);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6A8EFF), Color(0xFF4A6CF7)],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 4),

        ],
      ),
    );
  }

  void _showPlusMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                "创建新内容",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMenuOption(Icons.camera_alt, "拍照", () {}),
                  _buildMenuOption(Icons.photo_library, "相册", () {}),
                  _buildMenuOption(Icons.edit, "笔记", () {}),
                  _buildMenuOption(Icons.group, "群聊", () {}),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuOption(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.blue,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}