// Menjalankan program di depan (UI)
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text Login Uniersitas Teknokrat
            Text(
              "UNIVERSITAS TEKNOKRAT INDONESIA",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 32.0),
            // Email field
            TextField(
              controller: controller.cEmail,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            // Password field
            TextField(
              controller: controller.cPass,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            // Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  cAuth.login(
                    controller.cEmail.text,
                    controller.cPass.text,
                  ); // Call login function from controller
                },
                child: Text('Login'),
              ),
            ),
            SizedBox(height: 10.0),
            // Link for reset Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(Routes.RESET_PASSWORD);
                },
                child: Text("Reset Password"),
              ),
            ),
            SizedBox(height: 20.0),
            // Link for registration
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.SIGNUP);
              },
              child: Text(
                "Belum Punya Akun? Daftar Disini",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  cAuth.LoginGoogle();
                },
                child: Text('Login With Google'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
