// import 'package:flutter/material.dart';
//
// class FormErrorExampleScreen extends StatefulWidget {
//   const FormErrorExampleScreen({super.key});
//
//   @override
//   _FormErrorExampleScreenState createState() => _FormErrorExampleScreenState();
// }
//
// class _FormErrorExampleScreenState extends State<FormErrorExampleScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _priceController = TextEditingController();
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _priceController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Thêm Sản Phẩm')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Tên sản phẩm',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return '';
//                   }
//                   return null;
//                 },
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 errorBuilder: (context, errorText) {
//                   return Card(
//                     borderOnForeground: true,
//                     color: Colors.red.withOpacity(0.1),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: const [
//                           Icon(Icons.error_outline, color: Colors.red),
//                           SizedBox(width: 8),
//                           Text(
//                             'Tên sản phẩm không được để trống',
//                             style: TextStyle(color: Colors.red, fontSize: 14),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _priceController,
//                 decoration: const InputDecoration(
//                   labelText: 'Giá sản phẩm',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return '';
//                   }
//                   if (double.tryParse(value) == null ||
//                       double.parse(value) <= 0) {
//                     return '';
//                   }
//                   return null;
//                 },
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 errorBuilder: (context, errorText) {
//                   return Card(
//                     color: Colors.red.withOpacity(0.1),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: const [
//                           Icon(Icons.error_outline, color: Colors.red),
//                           SizedBox(width: 8),
//                           Text(
//                             'Giá phải là số dương',
//                             style: TextStyle(color: Colors.red, fontSize: 14),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Sản phẩm đã được thêm!')),
//                     );
//                   }
//                 },
//                 child: const Text('Thêm Sản Phẩm'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
