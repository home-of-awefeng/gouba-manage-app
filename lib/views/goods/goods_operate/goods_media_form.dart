import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../model/goods.dart';
import '../../../request/upload.dart';

class GoodsMediaForm extends StatefulWidget {
  List<GoodsMedia> medias;
  final Function(List<GoodsMedia>) onChange;
  GoodsMediaForm({super.key, required this.medias, required this.onChange});

  @override
  State<StatefulWidget> createState() {
    return GoodsMediaFormState();
  }
}

class GoodsMediaFormState extends State<GoodsMediaForm> {
  List<GoodsMedia> imgMedias = [];
  GoodsMedia? videoMedia;
  final ImagePicker imagePicker = ImagePicker();
  late VideoPlayerController videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void didUpdateWidget(covariant GoodsMediaForm oldWidget) {
    setState(() {
      for (var media in widget.medias) {
        if (media.type == "video") {
          videoMedia = media;
          videoPlayerController = VideoPlayerController.network(
            media.url,
          );
          _initializeVideoPlayerFuture = videoPlayerController.initialize();
        } else {
          imgMedias.add(media);
        }
      }
    });
  }

  // 上传视频
  void onSelectVideo() async {
    if (videoPlayerController.value.isInitialized) {
      videoPlayerController.pause();
      videoPlayerController.dispose();
    }
    XFile? videoFile = await imagePicker.pickVideo(source: ImageSource.gallery);
    try {
      if (videoFile != null) {
        EasyLoading.show(status: "解析中，请稍等...");
        MultipartFile videoMultipartFile = await MultipartFile.fromFile(
            videoFile.path,
            filename: "goods/${videoFile.hashCode}-${videoFile.name}");
        EasyLoading.dismiss();
        UploadFileRes res = await uploadFile(
            "goods/${videoFile.hashCode}-${videoFile.name}",
            videoMultipartFile);
        if (res.url.isNotEmpty && res.fileId.isNotEmpty) {
          GoodsMedia currentVideoMedia =
              GoodsMedia("video", res.url, res.fileId);
          widget.onChange([currentVideoMedia, ...imgMedias]);
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }

  // 上传图片
  void onSelectImage() async {
    XFile? imgFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imgFile == null) {
      EasyLoading.showError("请选择图片");
      return;
    }
    EasyLoading.show(status: "解析中，请稍等...");
    try {
      MultipartFile imgMultipartFile = await MultipartFile.fromFile(
          imgFile.path,
          filename: "goods/${imgFile.hashCode}-${imgFile.name}");

      EasyLoading.dismiss();

      UploadFileRes res = await uploadFile(
          "goods/${imgMultipartFile.hashCode}-${imgMultipartFile.filename}",
          imgMultipartFile);
      if (res.url.isNotEmpty && res.fileId.isNotEmpty) {
        GoodsMedia currentImgMedia = GoodsMedia("image", res.url, res.fileId);
        widget.onChange(videoMedia != null
            ? [videoMedia!, ...imgMedias, currentImgMedia]
            : [...imgMedias, currentImgMedia]);
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }

  // 删除视频
  void onDeleteVideo() {
    videoMedia = null;
    widget.onChange(imgMedias);
  }

  // 删除图片
  void onDeleteImage(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
                title: const Text("删除图片"),
                message: const Text("选择进行删除操作"),
                actions: <CupertinoActionSheetAction>[
                  ...imgMedias.map((media) => CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                        List<GoodsMedia> newImgMedias = [...imgMedias];
                        newImgMedias.removeWhere((m) => m.url == media.url);
                        widget.onChange(videoMedia != null
                            ? [videoMedia!, ...newImgMedias]
                            : newImgMedias);
                      },
                      child: Text("第${imgMedias.indexOf(media) + 1}张"))),
                ]));
  }

  @override
  Widget build(BuildContext context) {
    bool isVideoEmpty = videoMedia == null ||
        videoMedia!.fileId.isEmpty ||
        videoMedia!.url.isEmpty;
    print(
        "xxx, ${videoMedia?.toJson().toString()} ${imgMedias.toList().toString()}");
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("商品图片或者视频"),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (!isVideoEmpty)
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width,
            child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: videoPlayerController.value.aspectRatio,
                      // Use the VideoPlayer widget to display the video.
                      child: VideoPlayer(videoPlayerController),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        Row(children: [
          FilledButton(
              onPressed: onSelectVideo,
              child: Text(isVideoEmpty ? "上传视频" : "更改视频")),
          if (!isVideoEmpty)
            FilledButton(
                onPressed: () {
                  setState(() {
                    if (videoPlayerController.value.isPlaying) {
                      videoPlayerController.pause();
                    } else {
                      videoPlayerController.play();
                    }
                  });
                },
                child: Text(
                    videoPlayerController.value.isPlaying ? "停止播放" : "播放视频"))
        ])
      ]),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: imgMedias
              .map((media) => Image.network(media.url,
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100, errorBuilder: (BuildContext context,
                          Object exception, StackTrace? stackTrace) {
                    return const SizedBox(
                      width: 100,
                      height: 100,
                      child: Icon(Icons.broken_image),
                    );
                  }))
              .toList(),
        ),
        Row(children: [
          if (imgMedias.length < 3)
            FilledButton(onPressed: onSelectImage, child: const Text("上传图片")),
          if (imgMedias.isNotEmpty)
            FilledButton(
                onPressed: () => onDeleteImage(context),
                child: const Text("删除图片")),
        ])
      ])
    ]);
  }
}
