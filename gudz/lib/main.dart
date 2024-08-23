import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gudz/routes/routes.dart';
import 'package:gudz/theam.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
    
      theme:appTheme(),
      initialRoute: '/',
      getPages: AppRoutes.routes,
    );
  }
}

