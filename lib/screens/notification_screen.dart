import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Thông báo"), centerTitle: true),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.local_offer, color: Colors.orange),
            title: Text("Giảm giá 20%"),
            subtitle: Text("Mã giảm giá mới dành cho bạn!"),
          ),
        ],
      ),
    );
  }
}