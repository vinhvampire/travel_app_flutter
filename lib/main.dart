import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Import màn hình bạn vừa tạo

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false, // Tắt chữ Debug ở góc màn hình
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, // Bật giao diện Material 3 mới nhất cho đẹp
      ),
      // Đây là dòng quan trọng nhất: Chỉ định app bắt đầu từ HomeScreen
      home: const HomeScreen(),
    );
  }
}