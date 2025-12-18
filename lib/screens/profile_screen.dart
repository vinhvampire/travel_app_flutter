import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tài khoản"), centerTitle: true),
      body: const Center(child: Text("Thông tin cá nhân")),
    );
  }
}