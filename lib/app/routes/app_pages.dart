import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/binding/home_binding.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/pages/home_page.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/pages/surah_list_page.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding()
    ),

    GetPage(
      name: AppRoutes.LIST,
      page: () => SurahListPage(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft
    ),
  ];
}
