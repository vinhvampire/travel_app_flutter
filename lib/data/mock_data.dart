import '../models/destination_model.dart';
import '../models/hotel_model.dart';
import '../models/review_model.dart';

List<Destination> mockDestinations = [
  Destination(name: 'Quốc', activityCount: 90, imageUrl: 'https://tuyengiao.hagiang.gov.vn/upload/64711/20240401/grab76937cac_dao_o_phu_quoc_1_1632974771.jpg'),
  Destination(name: 'Sapa', activityCount: 60, imageUrl: 'https://cdn.ahit.vn/thanhthanhtours/wp-content/uploads/2024/10/15002407/du-lich-sapa-cover.jpg'),
];

List<Hotel> mockHotels = [
  Hotel(
    name: 'Mường Thanh Luxury',
    location: 'Đà Nẵng',
    price: 1200000,
    rating: 4.5,
    imageUrl: 'https://muongthanh.com/images/brands/2019/10/11/original/luxury-nhat-le_1570769504.jpg',
  ),
  Hotel(
    name: 'Pullman Resort',
    location: 'Vũng Tàu',
    price: 2500000,
    rating: 5.0,
    imageUrl: 'https://www.pullmanvungtau.com/wp-content/uploads/sites/23/2016/07/Deluxe-Executive.jpg',
  ),
];

List<Review> mockReviews = [
  Review(username: "Nguyễn Văn A", comment: "Phòng rất sạch sẽ, view đẹp tuyệt vời!", rating: 5.0, date: "15/12/2023"),
  Review(username: "Trần Thị B", comment: "Nhân viên nhiệt tình, đồ ăn sáng ngon.", rating: 4.5, date: "10/12/2023"),
];