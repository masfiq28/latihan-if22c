import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/dosen/controllers/dosen_controller.dart';

class DosenAddView extends GetView <DosenController> {
  const DosenAddView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data Dosen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller.cNidn ,
              decoration: const InputDecoration(
                labelText: 'NIDN',
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
              controller: controller.cProdi ,
              decoration: const InputDecoration(
                labelText: 'Prodi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.cFakultas ,
              decoration: const InputDecoration(
                labelText: 'Fakultas',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.add(
                    controller.cNidn.text, 
                    controller.cNama.text, 
                    controller.cProdi.text,
                    controller.cFakultas.text
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
