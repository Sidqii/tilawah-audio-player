import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/qari.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/preview_controller.dart';
import 'package:quran_mobile_app/shared/themes/app_color.dart';

class SelectQari extends GetView<PreviewController> {
  const SelectQari({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(letterSpacing: 1, fontWeight: FontWeight.w500);

    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(' Qari', style: textStyle),

          const SizedBox(height: 2),

          DropdownMenu<Qari>(
            key: ValueKey(controller.previewQari.value?.identifier),

            width: MediaQuery.of(context).size.width * 0.90,

            menuHeight: 250,

            initialSelection: controller.previewQari.value,

            hintText: 'Pilih Qari',

            menuStyle: MenuStyle(
              backgroundColor: const WidgetStatePropertyAll(AppColor.softWhite),

              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),

            inputDecorationTheme: InputDecorationTheme(
              hintStyle: const TextStyle(color: AppColor.grey600),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),

                borderSide: const BorderSide(color: AppColor.grey300),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),

                borderSide: const BorderSide(color: AppColor.grey600),
              ),
            ),

            onSelected: (qari) {
              if (qari != null) {
                controller.previewQari.value = qari;
              }
            },

            dropdownMenuEntries: controller.qariList.map((qari) {
              return DropdownMenuEntry<Qari>(
                trailingIcon: qari.identifier == 'ar.alafasy'
                    ? Icon(Icons.recommend)
                    : Icon(Icons.voice_chat),
                value: qari,
                label: qari.englishName,
              );
            }).toList(),
          ),
        ],
      );
    });
  }
}
