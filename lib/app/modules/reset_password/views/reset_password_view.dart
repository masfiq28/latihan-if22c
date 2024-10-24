// Menjalankan program di depan (UI)
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';


import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
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
              "RESET PASSWORD",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 32.0),
            // Email field
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            
            SizedBox(height: 20.0),
            // Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () {
                        controller.sendResetPasswordEmail();
                      },
                child: controller.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('Send Reset Email'),

                
              ),
            ),

            
            
          ],
        ),
      ),
    );
  }
}
