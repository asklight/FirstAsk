// lib/pages/profile_page.dart - 详细版本
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _userName = '微信用户';
  String _wechatId = 'wechat_123456';
  int _unreadMessages = 3;

  void _showEditProfileDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('编辑资料'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: '昵称'),
              onChanged: (value) {
                setState(() {
                  _userName = value;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: '微信号'),
              onChanged: (value) {
                setState(() {
                  _wechatId = value;
                });
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('资料已更新')),
              );
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('我'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Badge(
              smallSize: 8,
              backgroundColor: Colors.red,
              child: const Icon(Icons.camera_alt),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('拍照功能')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 顶部个人信息区域
            _buildProfileHeader(),

            // 服务菜单区域
            _buildServiceMenu(),

            // 支付相关区域
            _buildPaymentSection(),

            // 收藏、朋友圈、卡包等
            _buildFeatureSection(),

            // 设置和其他
            _buildSettingsSection(),
          ],
        ),
      ),
    );
  }

  // 构建顶部个人信息区域
  Widget _buildProfileHeader() {
    return GestureDetector(
      onTap: _showEditProfileDialog,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            // 头像
            Stack(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue[100],
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.blue,
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
                ),
              ],
            ),
            const SizedBox(width: 16),

            // 个人信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        _userName,
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
                          '微信号: $_wechatId',
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
                  const Row(
                    children: [
                      Icon(
                        Icons.flag,
                        size: 14,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '地区: 中国',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 右侧箭头和状态
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
      ),
    );
  }

  // 构建服务菜单
  Widget _buildServiceMenu() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.photo_library,
            iconColor: Colors.purple,
            title: '服务',
            showArrow: true,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('进入服务页面')),
              );
            },
          ),
        ],
      ),
    );
  }

  // 构建支付相关区域
  Widget _buildPaymentSection() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.payment,
            iconColor: Colors.blue,
            title: '支付',
            showArrow: true,
            badgeCount: _unreadMessages,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('进入支付页面')),
              );
            },
          ),
        ],
      ),
    );
  }

  // 构建功能区域
  Widget _buildFeatureSection() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.collections,
            iconColor: Colors.orange,
            title: '收藏',
            showArrow: true,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('进入收藏页面')),
              );
            },
          ),
          //_buildDivider(),
          _buildMenuItem(
            icon: Icons.photo_camera_back,
            iconColor: Colors.green,
            title: '朋友圈',
            showArrow: true,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('进入朋友圈')),
              );
            },
          ),
          //_buildDivider(),
          _buildMenuItem(
            icon: Icons.card_membership,
            iconColor: Colors.red,
            title: '卡包',
            showArrow: true,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('进入卡包页面')),
              );
            },
          ),
          //_buildDivider(),
          _buildMenuItem(
            icon: Icons.emoji_emotions,
            iconColor: Colors.purple,
            title: '表情',
            showArrow: true,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('进入表情商店')),
              );
            },
          ),
        ],
      ),
    );
  }

  // 构建设置区域
  Widget _buildSettingsSection() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.settings,
            iconColor: Colors.grey,
            title: '设置',
            showArrow: true,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('进入设置页面')),
              );
            },
          ),
        ],
      ),
    );
  }

  // 构建菜单项
  Widget _buildMenuItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    bool showArrow = true,
    int badgeCount = 0,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                icon,
                size: 20,
                color: iconColor,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            if (badgeCount > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  badgeCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            if (showArrow)
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }

  // 构建分割线
  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.only(left: 62),
      child: const Divider(
        height: 1,
        color: Colors.grey,
      ),
    );
  }
}