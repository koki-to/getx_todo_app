import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:getx_todo_app/bindings/app_binding.dart';
import 'package:getx_todo_app/controllers/locale_controller.dart';
import 'package:getx_todo_app/controllers/theme_controller.dart';
import 'package:getx_todo_app/data/app_middleware.dart';
import 'package:getx_todo_app/data/app_theme.dart';
import 'package:getx_todo_app/data/app_translations.dart';
import 'package:getx_todo_app/pages/add_todo_page.dart';
import 'package:getx_todo_app/pages/not_found_page.dart';
import 'package:getx_todo_app/services/storage_service.dart';

import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final themeController = Get.put(ThemeController());
  final localeController = Get.put(LocaleController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // 今回右上が被るので
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialBinding: AppBinding(),
      translations: AppTranslations(),
      themeMode: themeController.getThemeMode(),
      locale: localeController.getLocale(),
      fallbackLocale: AppTranslations.jaJP,
      defaultTransition: Transition.noTransition, // Webアプリなのでトランジションなし
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/todo',
          page: () => AddTodoPage(
            todoId: Get.parameters['id'],
          ),
          // middlewares: [
          //   AppMiddleware(),
          // ],
        ),
      ],
      unknownRoute: GetPage(name: '/404', page: () => const NotFoundPage()),
    );
  }
}
