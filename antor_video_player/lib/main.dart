import 'package:antor_video_player/bindings/view_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (_, child) {
          return GetMaterialApp(
            initialRoute: '/',
            getPages: [
              GetPage(
                  name: '/', page: () => const HomePage(), binding: ViesBindings()),
            ],
          );
        });
  }
}
