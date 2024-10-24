import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';

import 'app/routes/app_pages.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  // flutter belum di inisiasi ke framework fire base, jadi harus ditambahkan kode tsb
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CAuth = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:911647454.
    return StreamBuilder(
        stream: CAuth.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return GetMaterialApp(
              title: 'Mobile II IF 22 C',
              initialRoute: snapshot.data != null && snapshot.data!.emailVerified == true ? Routes.HOME : Routes.LOGIN,
              getPages: AppPages.routes,
            );
          }
          return Loading();
        });
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}