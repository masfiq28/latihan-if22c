import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/mahasiswa/controllers/mahasiswa_controller.dart';

class MahasiswaAddView extends GetView <MahasiswaController> {
  const MahasiswaAddView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data Mahasiswa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller.cNpm ,
              decoration: const InputDecoration(
                labelText: 'NPM',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.cNama,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.cAlamat ,
              decoration: const InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.add(
                    controller.cNpm.text, 
                    controller.cNama.text, 
                    controller.cAlamat.text
                  );
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
