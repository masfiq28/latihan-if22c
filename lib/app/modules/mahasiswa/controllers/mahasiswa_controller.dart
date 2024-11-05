import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MahasiswaController extends GetxController {
  //TODO: Implement MahasiswaController
  late TextEditingController cNpm;
  late TextEditingController cNama;
  late TextEditingController cAlamat;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference mahasiswa = firestore.collection('mahasiswa');

    return mahasiswa.get();
  }
  
  Stream<QuerySnapshot<Object?>> StreamData () {
    CollectionReference mahasiswa = firestore.collection('mahasiswa');
    
    return mahasiswa.snapshots();
  }
}

