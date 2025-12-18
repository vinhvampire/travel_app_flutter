import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/hotel_card.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Đặt chỗ của tôi"), centerTitle: true),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => HotelCard(hotel: mockHotels[0]),
      ),
    );
  }
}