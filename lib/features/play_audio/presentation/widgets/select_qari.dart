import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/qari.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/home_controller.dart';
import 'package:quran_mobile_app/shared/themes/app_color.dart';

class SelectQari extends GetView<HomeController> {
  const SelectQari({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownMenu<Qari>(
        key: ValueKey(
          controller.selectedQari.value?.identifier,
        ),

        width: double.infinity,

        menuHeight: 250,

        initialSelection: controller.selectedQari.value,

        hintText: 'Pilih Qari',

        menuStyle: MenuStyle(
          backgroundColor: const WidgetStatePropertyAll(
            AppColor.softWhite,
          ),

          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
            color: AppColor.grey600,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),

            borderSide: const BorderSide(
              color: AppColor.grey300,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),

            borderSide: const BorderSide(
              color: AppColor.grey600,
            ),
          ),
        ),

        onSelected: (qari) {
          if (qari != null) {
            controller.selectedQari.value = qari;
          }
        },

        dropdownMenuEntries: controller.qari.map((qari) {
          return DropdownMenuEntry<Qari>(
            value: qari,
            label: qari.englishName,
          );
        }).toList(),
      );
    });
  }
}