import 'dart:io';

import 'package:dio/dio.dart';

Future<FormData> createFormData(
    String key, File imageFile, Map<String, dynamic> additionalFields) async {
  String fileName = imageFile.path.split('/').last;

  return FormData.fromMap({
    key: await MultipartFile.fromFile(
      imageFile.path,
      filename: fileName,
    ),
    ...additionalFields, // Add the extra fields here
  });
}
