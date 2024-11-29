part of 'image_picker_cubit.dart';

enum ImagePickerStatus { initial, loading, loaded, error }

class ImagePickerState extends Equatable {
  const ImagePickerState(
      {this.file,
      this.imageDataBase64,
      this.imagePickerStatus = ImagePickerStatus.initial});
  final File? file;
  final String? imageDataBase64;
  final ImagePickerStatus imagePickerStatus;
  ImagePickerState copyWith(
      {File? file,
      String? imageDataBase64,
      ImagePickerStatus? imagePickerStatus}) {
    return ImagePickerState(
        file: file ?? this.file,
        imageDataBase64: imageDataBase64 ?? this.imageDataBase64,
        imagePickerStatus: imagePickerStatus ?? this.imagePickerStatus);
  }

  @override
  List<Object?> get props => [file, imageDataBase64, imagePickerStatus];
}
