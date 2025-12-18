import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/hotel_model.dart';
import '../widgets/destination_card.dart';
import '../widgets/hotel_card.dart';
import 'detail_screen.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  // 1. Tạo danh sách hiển thị (ban đầu là toàn bộ khách sạn)
  List<Hotel> displayList = List.from(mockHotels);

  // 2. Hàm xử lý tìm kiếm
  void updateList(String value) {
    setState(() {
      displayList = mockHotels
          .where((element) =>
          element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

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
                  child: TextField(
                    // 3. Gọi hàm lọc mỗi khi người dùng gõ chữ
                    onChanged: (value) => updateList(value),
                    decoration: const InputDecoration(
                        hintText: "Tìm khách sạn...",
                        prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
                        border: InputBorder.none
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Các phần Banner và Địa điểm giữ nguyên...
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

          // 4. Hiển thị danh sách đã lọc (displayList thay vì mockHotels)
          displayList.isEmpty
              ? const Center(child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Không tìm thấy khách sạn nào!"),
          ))
              : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: displayList.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(hotel: displayList[index]))),
              child: HotelCard(hotel: displayList[index]),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}