import 'package:ecommerce_task_elevate/home/view/screens/home_screen.dart';
import 'package:ecommerce_task_elevate/shared/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      designSize: const Size(720, 1640),
      child: MaterialApp(debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      ),
    );
  }
}
