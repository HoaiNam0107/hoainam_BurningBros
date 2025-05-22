// import 'package:flutter/material.dart';
//
// class ExpansibleExampleScreen extends StatefulWidget {
//   const ExpansibleExampleScreen({super.key});
//
//   @override
//   _ExpansibleExampleScreenState createState() =>
//       _ExpansibleExampleScreenState();
// }
//
// class _ExpansibleExampleScreenState extends State<ExpansibleExampleScreen> {
//   final List<Map<String, String>> faqItems = const [
//     {
//       'question': 'Flutter là gì?',
//       'answer':
//           'Flutter là một framework mã nguồn mở của Google để xây dựng giao diện người dùng đa nền tảng.',
//     },
//     {
//       'question': 'Expansible có gì mới?',
//       'answer':
//           'Expansible là widget mới trong Flutter 3.32, cho phép hiển thị nội dung có thể mở rộng/thu gọn.',
//     },
//     {
//       'question': 'Làm thế nào để sử dụng Expansible?',
//       'answer':
//           'Sử dụng headerBuilder, bodyBuilder và controller để quản lý trạng thái mở rộng/thu gọn.',
//     },
//   ];
//
//   late List<ExpansibleController> controllers;
//
//   @override
//   void initState() {
//     super.initState();
//     controllers = List.generate(faqItems.length, (_) => ExpansibleController());
//   }
//
//   @override
//   void dispose() {
//     for (var controller in controllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('FAQ với Expansible')),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemCount: faqItems.length,
//         itemBuilder: (context, index) {
//           final item = faqItems[index];
//           return Card(
//             elevation: 2,
//             margin: const EdgeInsets.only(bottom: 8.0),
//             child: Expansible(
//               controller: controllers[index],
//               headerBuilder: (
//                 BuildContext context,
//                 Animation<double> animation,
//               ) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       controllers[index].isExpanded
//                           ? controllers[index].collapse()
//                           : controllers[index].expand();
//                     });
//                   },
//                   child: ListTile(
//                     title: Text(
//                       item['question']!,
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     trailing: Icon(
//                       controllers[index].isExpanded
//                           ? Icons.arrow_drop_up
//                           : Icons.arrow_drop_down,
//                     ),
//                   ),
//                 );
//               },
//               bodyBuilder: (BuildContext context, Animation<double> animation) {
//                 return FadeTransition(
//                   opacity: animation,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(item['answer']!),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
