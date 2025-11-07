import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FocusPage extends StatefulWidget{
  const FocusPage({super.key});

  @override
  State<FocusPage> createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage>{
  String _userName = '微信用户';
  String _wechatId = 'wechat_123456';
  int _unreadMessages = 3;

  void _showEditProfileDialog(){
    showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          title: const Text("编辑资料"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  decoration: const InputDecoration(labelText: "昵称"),
                  onChanged: (value){
                    setState(() {
                      _userName = value;
                    });
                  }
              ),
              TextField(
                  decoration: const InputDecoration(labelText: "微信号"),
                  onChanged: (value){
                    setState(() {
                      _wechatId = value;
                    });
                  }
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: ()=>Navigator.pop(context),
                child: const Text("取消")
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("资料已更新")),
                );
              },
              child: const Text("保存"),
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title:const Text("关注"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
              icon:Badge(
                smallSize: 8,
                backgroundColor: Colors.red,
                child: const Icon(Icons.camera_alt),
              ),
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("camera")),
                );
              }
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(5, (index) => _buildProfileHeader(index)), // 生成5个人物列表
        ),
      ),
    );
  }

  Widget _buildProfileHeader(int index){
    // 创建不同的用户数据
    List<String> userNames = ['张三', '李四', '王五', '赵六', '钱七'];
    List<String> wechatIds = ['zhangsan', 'lisi', 'wangwu', 'zhaoliu', 'qianqi'];
    List<String> regions = ['北京', '上海', '广州', '深圳', '杭州'];
    List<Color> iconColors = [Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.red];

    return GestureDetector(
        onTap: _showEditProfileDialog,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: iconColors[index].withOpacity(0.2),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: iconColors[index],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 14,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          userNames[index], // 使用不同的用户名
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.male,
                          size: 16,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '微信号: ${wechatIds[index]}', // 使用不同的微信号
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.qr_code,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.flag,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '地区: ${regions[index]}', // 使用不同的地区
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Column(
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.green,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '状态',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}