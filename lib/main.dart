import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart'; // 1. BẮT BUỘC phải có dòng này

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // Chỉ định màn hình bắt đầu là LoginScreen
        home: const HomeScreen(),
    ); // Đóng MaterialApp
  } // Đóng hàm build
} // Đóng class TravelApp