// import 'dart:developer';

// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shoeclub/infrastructure/product/product_services.dart';
// import 'package:shoeclub/presentation/home/screen_home.dart';

// import '../../../application/home/home_provider.dart';
// import '../../../core/const_datas.dart';

// class DropdownFilter extends StatelessWidget {
//   const DropdownFilter({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     log(HomeProvider().selectedValue.toString());
//     return Consumer<HomeProvider>(
//       builder: (context, valueProvider, child) => DropdownButtonHideUnderline(
//         child: DropdownButton2(
//           isExpanded: true,
//           customButton: const Icon(
//             Icons.sort,
//             size: 35,
//             color: Colors.white,
//           ),

//           items:
//               // valueProvider.filter
//               //     .map<DropdownMenuItem<String>>(
//               //         (String value) => DropdownMenuItem<String>(
//               //               value: value,
//               //               onTap: () {
//               //                 valueProvider.dropdownShowProducts(value);
//               //               },
//               //               child: Text(
//               //                 value,
//               //                 style: const TextStyle(
//               //                   fontSize: 14,
//               //                   fontWeight: FontWeight.bold,
//               //                   color: Colors.white,
//               //                 ),
//               //                 overflow: TextOverflow.ellipsis,
//               //               ),
//               //             ))
//               //     .toList(),
//               const [
//             DropdownMenuItem(
//               value: 0,
//               child: Text("All"),
//             ),
//             DropdownMenuItem(
//               value: 1,
//               child: Text("Casual"),
//             ),
//             DropdownMenuItem(
//               value: 2,
//               child: Text("Formal"),
//             ),
//             DropdownMenuItem(
//               value: 3,
//               child: Text("Sports"),
//             )
//           ],
//           value: HomeProvider().selectedValue,

//           onChanged: (value) {
//             valueProvider.dropdownFilter(value!);
//           },
//           dropdownDirection: DropdownDirection.right,
//           itemHeight: 40,
//           style: TextStyle(color: buttonColor),
//           itemPadding: const EdgeInsets.only(left: 14, right: 14),
//           dropdownMaxHeight: 200,
//           dropdownWidth: 150,
//           dropdownPadding: null,
//           dropdownDecoration: BoxDecoration(
//             borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
//             color: buttonColor,
//           ),
//           dropdownElevation: 8,
//           scrollbarRadius: const Radius.circular(40),
//           scrollbarThickness: 6,
//           scrollbarAlwaysShow: true,
//           // offset: const Offset(-20, 0),
//         ),
//       ),
//     );
//   }
// }
