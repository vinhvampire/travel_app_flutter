// File: main.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Dữ liệu thô được tách ra để hiển thị trên UI
const String _emailAddress = 'myrealemail@example.com';
const String _phoneNumber = '+84901234567';
const String _smsNumber = '+84901234567';

// URI cho các hành động
final Uri _flutterUrl = Uri.parse('https://flutter.dev/docs');
final Uri _emailLaunchUri = Uri.parse('mailto:$_emailAddress?subject=Flutter%20Launcher%20Test&body=This%20is%20a%20test%20email%20from%20Flutter.');
final Uri _phoneCallUri = Uri.parse('tel:$_phoneNumber');
final Uri _smsLaunchUri = Uri.parse('sms:$_smsNumber?body=Tin%20nhắn%20từ%20ứng%20dụng%20Flutter');
final Uri _youtubeUrl = Uri.parse('https://www.youtube.com/watch?v=dQw4w9WgXcQ');

// =======================================================
// HÀM KHỞI CHẠY (Được đặt ở cấp độ toàn cục)
// =======================================================
Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Không thể khởi chạy $url. Hãy kiểm tra cấu hình nền tảng hoặc ứng dụng mặc định.');
  }
}
// =======================================================


void main() {
  runApp(const UrlLauncherApp());
}

class UrlLauncherApp extends StatelessWidget {
  const UrlLauncherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Launcher Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thử nghiệm URL Launcher'),
        centerTitle: true,
      ),
      body: ListView( // Sử dụng ListView thay cho Column để có thể cuộn
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          // =======================================================
          // PHẦN 1: THÔNG TIN LIÊN HỆ (ListTile Style)
          // =======================================================
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Thông tin Liên hệ Nhanh',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // Nút Email (Hiển thị địa chỉ)
          Card(
            child: ListTile(
              leading: const Icon(Icons.email, color: Colors.green), // Icon bên trái
              title: const Text('Email'),
              subtitle: const Text(_emailAddress), // Hiển thị địa chỉ email
              trailing: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _launchUrl(_emailLaunchUri),
                tooltip: 'Gửi Email',
              ),
              onTap: () => _launchUrl(_emailLaunchUri), // Bấm vào cả mục cũng kích hoạt hành động
            ),
          ),

          // Nút Điện thoại (Hiển thị SĐT)
          Card(
            child: ListTile(
              leading: const Icon(Icons.phone, color: Colors.orange), // Icon bên trái
              title: const Text('Số Điện thoại'),
              subtitle: const Text(_phoneNumber), // Hiển thị số điện thoại
              trailing: IconButton(
                icon: const Icon(Icons.call),
                onPressed: () => _launchUrl(_phoneCallUri),
                tooltip: 'Gọi Điện',
              ),
              onTap: () => _launchUrl(_phoneCallUri),
            ),
          ),

          // Nút SMS (Hiển thị SĐT)
          Card(
            child: ListTile(
              leading: const Icon(Icons.sms, color: Colors.blueGrey), // Icon bên trái
              title: const Text('Tin nhắn SMS'),
              subtitle: const Text(_smsNumber), // Hiển thị số điện thoại
              trailing: IconButton(
                icon: const Icon(Icons.message),
                onPressed: () => _launchUrl(_smsLaunchUri),
                tooltip: 'Gửi Tin nhắn',
              ),
              onTap: () => _launchUrl(_smsLaunchUri),
            ),
          ),

          const Divider(height: 32, thickness: 1),

          // =======================================================
          // PHẦN 2: CÁC LIÊN KẾT WEB (Dạng nút nhỏ gọn hơn)
          // =======================================================
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Các Liên kết Web',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          ElevatedButton.icon(
            onPressed: () => _launchUrl(_flutterUrl),
            icon: const Icon(Icons.web),
            label: const Text('Mở Trang chủ Flutter Docs'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              foregroundColor: Colors.blue.shade800,
              backgroundColor: Colors.blue.shade50,
              elevation: 0,
            ),
          ),
          const SizedBox(height: 12),

          ElevatedButton.icon(
            onPressed: () => _launchUrl(_youtubeUrl),
            icon: const Icon(Icons.videocam),
            label: const Text('Mở Video YouTube'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              foregroundColor: Colors.red.shade800,
              backgroundColor: Colors.red.shade50,
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}