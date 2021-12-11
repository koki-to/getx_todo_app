import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:getx_todo_app/data/app_theme.dart';
import 'package:getx_todo_app/pages/add_todo_page.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // 今回右上が被るので
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system, // TODO:SharedPreferencesの保存データを読み込んでここに設定
      locale: null, // TODO:SharedPreferencesの保存データを読み込んでここに設定
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
        ),
      ],
    );
  }
}
