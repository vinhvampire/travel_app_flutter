import 'package:flutter/material.dart';
import '../models/hotel_model.dart';

class DetailScreen extends StatelessWidget {
  final Hotel hotel;
  const DetailScreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hình ảnh khách sạn
                Image.network(hotel.imageUrl, height: 350, width: double.infinity, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hotel.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.blueAccent, size: 20),
                          const SizedBox(width: 5),
                          Text(hotel.location, style: const TextStyle(color: Colors.grey, fontSize: 16)),
                        ],
                      ),
                      const Divider(height: 40),
                      const Text("Giới thiệu", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      const Text(
                        "Trải nghiệm kỳ nghỉ tuyệt vời tại khách sạn sang trọng với view nhìn ra toàn thành phố. Dịch vụ đẳng cấp quốc tế đang chờ đón bạn.",
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          // Nút quay lại
          Positioned(
            top: 50,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}