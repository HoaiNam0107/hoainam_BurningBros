// import 'package:flutter/material.dart';
//
// class ExpansionTileExample extends StatefulWidget {
//   const ExpansionTileExample({super.key});
//
//   @override
//   _ExpansionTileExampleState createState() => _ExpansionTileExampleState();
// }
//
// class _ExpansionTileExampleState extends State<ExpansionTileExample> {
//   final ExpansibleController _controller = ExpansibleController();
//   bool _isExpanded = false;
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> details = [
//       'Chi tiết 1: Đây là thông tin bổ sung.',
//       'Chi tiết 2: Một thông tin khác.',
//       'Chi tiết 3: Thông tin cuối cùng.',
//     ];
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Ví dụ về ExpansionTile')),
//       body: ListView(
//         padding: const EdgeInsets.all(8.0),
//         children: [
//           ExpansionTile(
//             title: Row(
//               children: const [
//                 Icon(Icons.info, color: Colors.blue),
//                 SizedBox(width: 8.0),
//                 Text(
//                   'Tiêu đề chính',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//
//             // Thuộc tính 2: subtitle - Phần phụ đề hiển thị bên dưới title
//             subtitle: const Text(
//               'Phụ đề: Nhấn để xem chi tiết',
//               style: TextStyle(fontSize: 14, color: Colors.grey),
//             ),
//
//             // Thuộc tính 3: leading - Widget hiển thị bên trái title
//             leading: const Icon(Icons.star, color: Colors.yellow),
//
//             // Thuộc tính 4: trailing - Widget hiển thị bên phải (thường là icon mở/thu gọn)
//             trailing: Icon(
//               _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
//               color: Colors.black,
//             ),
//
//             // Thuộc tính 5: children - Nội dung mở rộng hiển thị khi ExpansionTile mở
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Nội dung mở rộng:',
//                       style: TextStyle(fontStyle: FontStyle.italic),
//                     ),
//                     const SizedBox(height: 10),
//                     ...details
//                         .map(
//                           (item) => Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 4.0),
//                             child: Text(
//                               item,
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                           ),
//                         )
//                         .toList(),
//                   ],
//                 ),
//               ),
//             ],
//
//             // Thuộc tính 6: controller - Kiểm soát trạng thái mở rộng/thu gọn
//             controller: _controller,
//
//             // Thuộc tính 7: initiallyExpanded - Xác định trạng thái ban đầu (mở hay đóng)
//             initiallyExpanded: false,
//
//             // Thuộc tính 8: onExpansionChanged - Callback khi trạng thái mở rộng thay đổi
//             onExpansionChanged: (bool expanded) {
//               setState(() {
//                 _isExpanded =
//                     expanded; // Cập nhật trạng thái để thay đổi trailing
//               });
//               print('ExpansionTile hiện đang: ${expanded ? 'mở' : 'đóng'}');
//             },
//
//             // Thuộc tính 9: tilePadding - Khoảng cách bên trong ExpansionTile
//             tilePadding: const EdgeInsets.symmetric(
//               horizontal: 16.0,
//               vertical: 8.0,
//             ),
//
//             // Thuộc tính 10: childrenPadding - Khoảng cách của nội dung mở rộng (children)
//             childrenPadding: const EdgeInsets.only(bottom: 8.0),
//
//             // Thuộc tính 11: expandedAlignment - Căn chỉnh nội dung mở rộng
//             expandedAlignment: Alignment.centerLeft,
//
//             // Thuộc tính 12: expandedCrossAxisAlignment - Căn chỉnh ngang của nội dung mở rộng
//             expandedCrossAxisAlignment: CrossAxisAlignment.start,
//
//             // Thuộc tính 13: backgroundColor - Màu nền của ExpansionTile khi chưa mở
//             backgroundColor: Colors.grey[200],
//
//             // Thuộc tính 14: collapsedBackgroundColor - Màu nền khi thu gọn
//             collapsedBackgroundColor: Colors.white,
//
//             // Thuộc tính 15: textColor - Màu chữ của title khi mở
//             textColor: Colors.blue,
//
//             // Thuộc tính 16: collapsedTextColor - Màu chữ của title khi thu gọn
//             collapsedTextColor: Colors.black,
//
//             // Thuộc tính 17: iconColor - Màu của icon (trailing) khi mở
//             iconColor: Colors.blue,
//
//             // Thuộc tính 18: collapsedIconColor - Màu của icon (trailing) khi thu gọn
//             collapsedIconColor: Colors.black,
//
//             // Thuộc tính 19: controlAffinity - Vị trí của icon mở/thu gọn
//             controlAffinity: ListTileControlAffinity.trailing,
//
//             // Thuộc tính 20: shape - Hình dạng của ExpansionTile khi mở
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(8.0)),
//             ),
//
//             // Thuộc tính 21: collapsedShape - Hình dạng của ExpansionTile khi thu gọn
//             collapsedShape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(8.0)),
//               side: BorderSide(color: Colors.grey),
//             ),
//
//             // Thuộc tính 22: clipBehavior - Cách xử lý khi nội dung vượt ngoài giới hạn
//             clipBehavior: Clip.antiAlias,
//
//             // Thuộc tính 23: dense - Giảm chiều cao của ExpansionTile
//             dense: false,
//
//             // Thuộc tính 24: visualDensity - Điều chỉnh mật độ giao diện
//             visualDensity: VisualDensity.standard,
//
//             // Thuộc tính 25: enableFeedback - Âm thanh/hiệu ứng khi nhấn
//             enableFeedback: true,
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 if (_controller.isExpanded) {
//                   _controller.collapse();
//                 } else {
//                   _controller.expand();
//                 }
//               });
//             },
//             child: const Text('Điều khiển ExpansionTile'),
//           ),
//         ],
//       ),
//     );
//   }
// }
