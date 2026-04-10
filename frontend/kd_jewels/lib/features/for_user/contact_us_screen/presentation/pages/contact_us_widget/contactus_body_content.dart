// import 'package:flutter/material.dart';
// import '../../../../../core/constants/app_colors.dart';
// import '../../../../../core/utils/app_utils.dart';
// import '../../../../../core/constants/app_strings.dart';
//
// Widget contactUsBodyContent(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: AppUtils.appPadding, vertical: AppUtils.appPadding),
//     child: Column(
//       children: [
//         expansionTile(
//           Icons.history_outlined,
//           AppStrings.orderHistory,
//           () {},
//         ),
//         expansionTile(
//           Icons.fmd_good_sharp,
//           AppStrings.shippingAddress,
//           () {},
//         ),
//         expansionTile(
//           Icons.payments,
//           AppStrings.paymentMethod,
//           () {},
//         ),
//         expansionTile(
//           Icons.settings,
//           AppStrings.accountSettings,
//           () {},
//         ),
//         expansionTile(
//           Icons.notifications,
//           AppStrings.notifications,
//           () {},
//         ),
//         expansionTile(
//           Icons.favorite,
//           AppStrings.wishlistItem,
//           () {},
//         ),
//         expansionTile(
//           Icons.diamond_rounded,
//           AppStrings.myMeasurements,
//           () {},
//         ),
//       ],
//     ),
//   );
// }
//
// Widget expansionTile(IconData leadingIcon, String title, VoidCallback onTap) {
//   return Container(
//     margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
//     decoration: BoxDecoration(
//       color: Colors.grey.shade200, // optional: tile background
//       borderRadius: BorderRadius.circular(8),
//     ),
//     child: InkWell(
//       onTap: onTap,
//       child: ExpansionTile(
//         collapsedShape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(8)),
//         ),
//         dense: true,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(8)),
//         ),
//         title: Text(
//           title,
//           style: TextStyle(fontWeight: FontWeight.w500),
//         ),
//         leading: Icon(
//           leadingIcon,
//           color: AppColors.primaryColor,
//         ),
//         iconColor: AppColors.primaryColor,
//         trailing: const Icon(
//           Icons.arrow_forward_ios,
//           color: AppColors.primaryColor,
//         ),
//         childrenPadding: EdgeInsets.zero,
//       ),
//     ),
//   );
// }
