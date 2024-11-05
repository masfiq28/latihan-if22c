import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mahasiswa_controller.dart';

class MahasiswaView extends GetView<MahasiswaController> {
  const MahasiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: Get.put(MahasiswaController()).StreamData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          //ambil data dari firebase
          var listAllDocs = snapshot.data?.docs ?? [];
          return listAllDocs.length > 0
              ? ListView.builder(
                  itemCount: listAllDocs.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                      backgroundColor: Colors.white,
                    ),
                    title: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}"),
                    subtitle: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["npm"]}"),
                    trailing: IconButton(
                        onPressed: () {}, 
                        icon: Icon(Icons.more_vert)),
                  ),
                )
              : Center(
                  child: Text("data kosong"),
                );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}