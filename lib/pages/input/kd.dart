// import 'package:flutter/material.dart';

// class KontakDaruratPages extends StatefulWidget {
//   KontakDaruratPages({super.key});

//   @override
//   State<KontakDaruratPages> createState() => _KontakDaruratPagesState();
// }

// class _KontakDaruratPagesState extends State<KontakDaruratPages> {
//   final List<TextEditingController> listController = [TextEditingController()];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         toolbarHeight: 65,
//         backgroundColor: Colors.grey[900],
//         centerTitle: true,
//         title: Text('Kontak Darurat'),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Masukkan No Kontak Darurat!",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey[900],
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               ListView.builder(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 shrinkWrap: true,
//                 itemCount: listController.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(top: 15),
//                     child: Row(
//                       children: [
//                         TextFormField(
//                           controller: listController[index],
//                           autofocus: false,
//                           cursorColor: Colors.grey[900],
//                           showCursor: true,
//                           decoration: InputDecoration(
//                             label: Text("No Whatsapp"),
//                             labelStyle: TextStyle(color: Colors.grey[900]),
//                             fillColor: Colors.grey[900],
//                             focusColor: Colors.grey[900],
//                             iconColor: Colors.grey[900],
//                             hoverColor: Colors.grey[900],
//                             icon: Icon(Icons.call, size: 35),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide:
//                                     BorderSide(color: Colors.grey.shade900)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide:
//                                     BorderSide(color: Colors.grey.shade900)),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         index != 0
//                             ? GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     listController[index].clear();
//                                     listController[index].dispose();
//                                     listController.removeAt(index);
//                                   });
//                                 },
//                                 child: Icon(
//                                   Icons.delete,
//                                   color: Colors.grey.shade900,
//                                   size: 35,
//                                 ),
//                               )
//                             : const SizedBox()
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     listController.add(TextEditingController());
//                   });
//                 },
//                 child: Center(
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 15),
//                     decoration: BoxDecoration(
//                         color: Colors.grey[900],
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Text("Add More",
//                         style: TextStyle(color: const Color(0xFFF8F8FF))),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
