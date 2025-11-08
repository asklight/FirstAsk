import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/message_item.dart';
import 'chat_detail_page.dart';

class MessagePage extends StatefulWidget{
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('消息'),
      ),
      body: ListView(
        children: [
          MessageItem(
            "assets/images/trump.jpg",
            "特朗普",
            "拜登今天肯定拉在裤裆里啦",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChatDetailPage(
                        name: "特朗普",
                        avatarUrl: "assets/images/trump.jpg",
                      ),
                ),
              );
            },
          ),
          MessageItem(
            "assets/images/putin.jpg",
            "普京",
            "你怎么知道的",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChatDetailPage(
                        name: "普京",
                        avatarUrl: "assets/images/putin.jpg",
                      ),
                ),
              );
            },
          ),
          MessageItem(
            "assets/images/biden.jpg",
            "拜登",
            "胡说，不是今天",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChatDetailPage(
                        name: "拜登",
                        avatarUrl: "assets/images/biden.jpg",
                      ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}