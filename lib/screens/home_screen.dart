import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/destination_card.dart';
import '../widgets/hotel_card.dart';
import 'detail_screen.dart';
import 'booking_screen.dart';       // Import các file mới tạo
import 'notification_screen.dart';
import 'profile_screen.dart';
import 'home_content.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),      // Phần nội dung trang chủ (giữ lại ở file này hoặc tách tiếp)
    const BookingPage(),      // Gọi từ file mới
    const NotificationPage(), // Gọi từ file mới
    const ProfilePage(),      // Gọi từ file mới
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Đặt chỗ'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Thông báo'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
        ],
      ),
    );
  }
}