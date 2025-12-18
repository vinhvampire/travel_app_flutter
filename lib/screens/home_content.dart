import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/destination_card.dart';
import '../widgets/hotel_card.dart';
import 'detail_screen.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header màu xanh
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
                    decoration: InputDecoration(
                        hintText: "Tìm khách sạn...",
                        prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
                        border: InputBorder.none
                    ),
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