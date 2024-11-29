import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as paths;
import 'package:path_provider/path_provider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template/config/themes/themeExtension/theme_extension.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(const ImagePickerState());

  Future<File?> getImage(
      {required BuildContext context, double? x, double? y}) async {
    try {
      // Emit loading state
      emit(state.copyWith(imagePickerStatus: ImagePickerStatus.loading));

      // Pick an image
      var pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        // Crop the image
        var croppedImage = await ImageCropper().cropImage(
            compressFormat: ImageCompressFormat.png,
            sourcePath: pickedImage.path,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              // CropAspectRatioPreset.ratio3x2,
              // CropAspectRatioPreset.original,
              // CropAspectRatioPreset.ratio4x3,
              // CropAspectRatioPreset.ratio16x9,
            ],
            // aspectRatio: CropAspectRatio(ratioX: 6, ratioY: 6),

            cropStyle: CropStyle.rectangle,
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: 'Mero Ticker Cropper',
                toolbarWidgetColor: appColors(context).black,
                initAspectRatio: CropAspectRatioPreset.original,
                backgroundColor: appColors(context).black,
                lockAspectRatio: true,
              ),
              IOSUiSettings(
                title: 'Mero Ticker Cropper',
                aspectRatioLockEnabled: true,
              )
            ]);

        if (croppedImage != null) {
          File file = File(croppedImage.path);

          // Convert the image bytes to a Base64-encoded string
          List<int> imageBytes = await File(croppedImage.path).readAsBytes();
          String base64Image = base64Encode(imageBytes);

          // Emit loaded state with the file and base64 data
          emit(state.copyWith(
            file: file,
            imageDataBase64: base64Image,
            imagePickerStatus: ImagePickerStatus.loaded,
          ));
          return file;
        } else {
          // Emit error state if cropping was canceled
          emit(state.copyWith(imagePickerStatus: ImagePickerStatus.error));
        }
      } else {
        // Emit error state if no image was selected
        emit(state.copyWith(imagePickerStatus: ImagePickerStatus.error));
      }
    } catch (e) {
      // Emit error state on exception
      emit(state.copyWith(imagePickerStatus: ImagePickerStatus.error));
    }
    return null;
  }

  Future<File> compressImage(File imageFile) async {
    final dir = await getTemporaryDirectory();
    final targetPath = paths.join(dir.absolute.path, "${imageFile.path}.jpg");

    var result = await FlutterImageCompress.compressAndGetFile(
      imageFile.absolute.path, targetPath,
      quality: 30, // Compress quality (0-100)
    );

    return File(result!.path);
  }
}
