import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/destination_card.dart';
import '../widgets/hotel_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const Center(child: Text("Màn hình đặt chỗ")),
    const Center(child: Text("Màn hình thông báo")),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        onTap: (index) => setState(() => _selectedIndex = index),
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

// Widget chứa nội dung trang chủ
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Bạn muốn đi đâu?", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                  child: const TextField(
                    decoration: InputDecoration(hintText: "Tìm khách sạn...", prefixIcon: Icon(Icons.search, color: Colors.blueAccent), border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.all(16.0), child: Text('Địa điểm nổi bật', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockDestinations.length,
              itemBuilder: (context, index) => DestinationCard(destination: mockDestinations[index]),
            ),
          ),
          const Padding(padding: EdgeInsets.all(16.0), child: Text('Khách sạn gợi ý', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: mockHotels.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(hotel: mockHotels[index]))),
              child: HotelCard(hotel: mockHotels[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tài khoản"), centerTitle: true),
      body: const Center(child: Text("Thông tin cá nhân của bạn")),
    );
  }
}