import 'package:flutter/material.dart';

class MapLikeScreen extends StatelessWidget {
  const MapLikeScreen({super.key});

  // Factory method để tạo marker
  Widget _buildMarker(String label, int badgeText, Offset position,
      {bool isActive = false}) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 80,
          height: 120,
          decoration: BoxDecoration(
            color: isActive ? Colors.orange : Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.white, size: 30),
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
              if (badgeText > 0)
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$badgeText',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Hình ảnh nền thay thế bản đồ
          Image.asset(
            'assets/map_placeholder.jpg', // Thay bằng hình ảnh của bạn
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // Tiêu đề hoặc thanh tìm kiếm
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white.withOpacity(0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '대치 1동 찻소통',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Xử lý tìm kiếm
                  },
                ),
              ],
            ),
          ),
          // Marker 1: Vị trí hiện tại (màu xanh)
          _buildMarker('현재위치', 0, const Offset(50, 200), isActive: true),
          // Marker 2: Điểm với 5 đánh giá
          _buildMarker('학원명', 5, const Offset(150, 300)),
          // Marker 3: Điểm với 10+ đánh giá
          _buildMarker('학원명', 10, const Offset(250, 400)),
          // Marker 4: Điểm với 1 đánh giá
          _buildMarker('학원명', 1, const Offset(100, 500)),
          // Nút tròn màu xanh lá ở góc dưới cùng bên phải
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                // Xử lý nút (ví dụ: định vị lại)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Recenter Map')),
                );
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.my_location, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
