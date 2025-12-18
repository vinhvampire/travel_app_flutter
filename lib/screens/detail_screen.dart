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
  int _selectedIndex = 0; // Quản lý tab đang chọn

  // Danh sách các màn hình để chuyển đổi
  final List<Widget> _pages = [
    const HomeContent(), // Nội dung trang chủ hiện tại của bạn
    const Center(child: Text("Màn hình đặt chỗ")),
    const Center(child: Text("Màn hình thông báo")),
    const ProfilePage(), // Trang tài khoản (sẽ viết ở dưới)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed, // Hiển thị tất cả label
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
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

// Tách nội dung cũ của bạn ra một Widget riêng
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header xanh và Tìm kiếm
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
          // Địa điểm nổi bật
          const Padding(padding: EdgeInsets.all(16.0), child: Text('Địa điểm nổi bật', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockDestinations.length,
              itemBuilder: (context, index) => DestinationCard(destination: mockDestinations[index]),
            ),
          ),
          // Khách sạn gợi ý
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
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// Widget trang tài khoản đơn giản
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tài khoản"), centerTitle: true),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(radius: 50, backgroundImage: NetworkImage("https://i.pravatar.cc/300")),
          const SizedBox(height: 10),
          const Text("Vinh Vampire", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const Text("vinhvampire@email.com", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),
          const ListTile(leading: Icon(Icons.settings), title: Text("Cài đặt")),
          const ListTile(leading: Icon(Icons.help_outline), title: Text("Trung tâm hỗ trợ")),
          const ListTile(leading: Icon(Icons.logout, color: Colors.red), title: Text("Đăng xuất", style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}