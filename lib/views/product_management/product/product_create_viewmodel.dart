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
          maxAssets: 2,
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
}