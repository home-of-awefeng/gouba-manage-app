import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:shop_app/mvvm/base_view_model.dart';

class ProductCreateViewModel extends BaseViewModel {
  // XFile? image;
  // List<XFile>? imageList;
  // XFile? video;

  void selectImages (BuildContext context) async {
    final List<AssetEntity>? result = await AssetPicker.pickAssets(
      context,
      pickerConfig: const AssetPickerConfig(
          maxAssets: 3,
          requestType: RequestType.image
      ),
    );
  }

  void selectVideo (BuildContext context) async {
    final List<AssetEntity>? result = await AssetPicker.pickAssets(
      context,
      pickerConfig: const AssetPickerConfig(
          maxAssets: 1,
          requestType: RequestType.video
      ),
    );
  }

  // void selectMultiImage() async {
  //   List<XFile>? images = await _imagePicker.pickMultiImage();
  //   if (images.isEmpty) imageList = images;
  // }
  //
  // void selectImageCamera() async {
  //   XFile? photo = await _imagePicker.pickImage(
  //       source: ImageSource.camera,
  //       preferredCameraDevice: CameraDevice.rear,
  //   );
  //   if (photo != null) image = photo;
  // }
  //
  // void selectVideo() async {
  //   XFile? video = await _imagePicker.pickVideo(source: ImageSource.gallery);
  //   if (video != null) this.video = video;
  // }
  //
  // void selectCameraVideo () async {
  //   XFile? video = await _imagePicker.pickVideo(
  //     source: ImageSource.camera,
  //   );
  //   if (video != null) this.video = video;
  // }
}