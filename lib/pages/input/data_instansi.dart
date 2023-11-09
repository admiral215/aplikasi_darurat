// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';

// class DataInstansiPages extends StatelessWidget {
//   const DataInstansiPages({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
      
//       appBar: AppBar(
//         toolbarHeight: 65,
//         backgroundColor: Colors.grey[900],
//         centerTitle: true,
//         title: Text('Data Instansi'),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(20),
//         children: [
//           DropdownSearch<String>(
//             popupProps: PopupProps.dialog(
//               showSelectedItems: true,
//               fit: FlexFit.loose
//             ),
//             items: ["POLRES BANDUNG","POLSEKTA SUKASARI",],
//             dropdownDecoratorProps: DropDownDecoratorProps(
//               dropdownSearchDecoration: InputDecoration(
//                 labelText: "Kepolisian",
//                 hintText: "country in menu mode",
//               ),
//             ),
//             onChanged: print,
//             selectedItem: "POLRES BANDUNG",
//           ),
//           SizedBox(height: 20),
//           DropdownSearch<String>(
//             popupProps: PopupProps.dialog(
//               showSelectedItems: true,
//               disabledItemFn: (String s) => s.startsWith('I'),
//               fit: FlexFit.loose
//             ),
//             items: ["RS HASAN SADIKIN", "RSUD AL - IHSAN", ],
//             dropdownDecoratorProps: DropDownDecoratorProps(
//               dropdownSearchDecoration: InputDecoration(
//                 labelText: "Rumah Sakit",
//                 hintText: "country in menu mode",
//               ),
//             ),
//             onChanged: print,
//             selectedItem: "RS HASAN SADIKIN",
//           ),
//           SizedBox(height: 20),
//           DropdownSearch<String>(
//             popupProps: PopupProps.dialog(
//               showSelectedItems: true,
//               fit: FlexFit.loose
//             ),
//             items: ["DAMKAR KOTA BANDUNG", ],
//             dropdownDecoratorProps: DropDownDecoratorProps(
//               dropdownSearchDecoration: InputDecoration(
//                 labelText: "Pemadam Kebakaran",
//                 hintText: "country in menu mode",
//               ),
//             ),
//             onChanged: print,
//             selectedItem: "DAMKAR KOTA BANDUNG",
//           ),
//           SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
