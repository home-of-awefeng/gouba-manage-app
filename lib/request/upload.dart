import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shop_app/request/request.dart';

part 'upload.g.dart';

@JsonSerializable()
class UploadFileRes {
  String url;
  String fileId;
  UploadFileRes(this.url, this.fileId);

  factory UploadFileRes.fromJson(Map<String, dynamic> json) =>
      _$UploadFileResFromJson(json);
  Map<String, dynamic> toJson() => _$UploadFileResToJson(this);
}

Future<UploadFileRes> uploadFile(
  String path,
  MultipartFile file,
) async {
  UploadFileRes uploadFileRes = UploadFileRes("", "");
  EasyLoading.show(status: "上传中，请稍等...", maskType: EasyLoadingMaskType.black);
  try {
    FormData formData = FormData.fromMap({"path": path, "file": file});
    var res = await dio.post("/api/upload",
        options: Options(contentType: Headers.multipartFormDataContentType),
        data: formData);
    ApiResponse<UploadFileRes> result = ApiResponse.fromJson(res.data,
        (json) => UploadFileRes.fromJson(json as Map<String, dynamic>));
    if (result.code == 200 && result.data?.url != null) {
      EasyLoading.showToast("上传成功");
      uploadFileRes.url = result.data!.url;
      uploadFileRes.fileId = result.data!.fileId;
    } else {
      throw Exception(result.message);
    }
  } catch (e) {
    EasyLoading.dismiss();
    EasyLoading.showError(e.toString());
  }
  return uploadFileRes;
}
