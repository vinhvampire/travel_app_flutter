import 'package:flutter/material.dart';
import '../models/hotel_model.dart';
import 'login_screen.dart';

class DetailScreen extends StatelessWidget {
  final Hotel hotel;
  const DetailScreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false; // Trạng thái giả định

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero animation chuyển cảnh ảnh
                Hero(
                  tag: hotel.imageUrl, // Phải giống hệt tag bên HotelCard
                  child: Image.network(hotel.imageUrl, height: 350, width: double.infinity, fit: BoxFit.cover),
                ),
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
                      const Text("Tiện ích", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildAmenity(Icons.wifi, "Wifi"),
                          _buildAmenity(Icons.pool, "Hồ bơi"),
                          _buildAmenity(Icons.ac_unit, "Máy lạnh"),
                          _buildAmenity(Icons.restaurant, "Bữa sáng"),
                        ],
                      ),
                      const Divider(height: 40),
                      const Text("Giới thiệu", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      const Text(
                        "Trải nghiệm kỳ nghỉ tuyệt vời tại khách sạn sang trọng với view nhìn ra toàn thành phố. Dịch vụ đẳng cấp quốc tế đang chờ đón bạn.",
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),

                      // --- PHẦN ĐÁNH GIÁ (REVIEWS) ---
                      const Divider(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Đánh giá", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          TextButton(onPressed: () {}, child: const Text("Xem tất cả")),
                        ],
                      ),
                      _buildReviewItem("Nguyễn Văn A", "5.0", "Phòng cực kỳ sạch sẽ và phục vụ chu đáo."),
                      _buildReviewItem("Trần Thị B", "4.8", "Vị trí thuận tiện, gần trung tâm thành phố."),

                      const SizedBox(height: 120),
                    ],
                  ),
                ),
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
          // Thanh đặt phòng dưới cùng
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Giá từ", style: TextStyle(color: Colors.grey)),
                        Text("${hotel.price}đ", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (!isLoggedIn) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      } else {
                        print("Đặt thành công!");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: const Text("Đặt ngay", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenity(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.blueAccent),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildReviewItem(String name, String rating, String comment) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 16),
              const SizedBox(width: 5),
              Text(rating, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 10),
              Text(name, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 5),
          Text(comment),
        ],
      ),
    );
  }
}