import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageUtils {
  final storage = FirebaseStorage.instance;

  Future<String?> uploadImage({
    required String path,
    required File file,
  }) async {
    try {
      final Reference ref = storage.ref().child(path).child(file.path);
      final val = await ref.putFile(file);
      return await val.ref.getDownloadURL();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteImage({required String imagePath}) async {
    try {
      final Reference ref = storage.ref().child(imagePath);

      await ref.delete();
    } catch (e) {
      rethrow;
    }
  }
}

