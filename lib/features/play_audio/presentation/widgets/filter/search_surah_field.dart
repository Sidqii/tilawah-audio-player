// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quran_mobile_app/app/routes/app_pages.dart';
// import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/filter_controller.dart';
// import 'package:quran_mobile_app/shared/themes/app_color.dart';

// class SearchSurahField extends GetView<FilterController> {
//   const SearchSurahField({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller.searchController,

//       decoration: InputDecoration(
//         hintText: 'Cari Surah...',
//         prefixIcon: const Icon(Icons.search),

//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: AppColor.grey300),
//         ),

//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: AppColor.grey600),
//         ),
//       ),

//       onTap: () {
//         Get.toNamed(AppRoutes.FILTER);
//       },

//       onChanged: (value) {
//         controller.surahQuery.value = value;
//       },
//     );
//   }
// }
