import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông báo", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotifyItem(
              Icons.card_giftcard,
              "Ưu đãi mới!",
              "Giảm ngay 20% cho lần đặt phòng đầu tiên tại Đà Lạt.",
              "2 giờ trước"
          ),
          _buildNotifyItem(
              Icons.verified_user,
              "Tài khoản",
              "Cập nhật thông tin bảo mật thành công.",
              "1 ngày trước"
          ),
        ],
      ),
    );
  }

  Widget _buildNotifyItem(IconData icon, String title, String desc, String time) {
    return Card(
      elevation: 0,
      color: Colors.grey[50],
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent.withOpacity(0.1),
          child: Icon(icon, color: Colors.blueAccent),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc),
        trailing: Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ),
    );
  }
}