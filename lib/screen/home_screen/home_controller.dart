import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reels_viewer/reels_viewer.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  bool hart = false;
  bool vHart = false;
  bool book = false;
  bool vBook = false;

  late final PageController pageController;
  late VideoPlayerController controller;
  int selectedIndex = 0;

  List<ReelModel> reelsList = [
    ReelModel(
        'https://assets.mixkit.co/videos/preview/mixkit-tree-with-yellow-flowers-1173-large.mp4',
        '',
        profileUrl: '',
        commentList: [
          ReelCommentModel(
            comment: '',
            userProfilePic: '',
            userName: '',
            commentTime: DateTime.now(),
          ),
          ReelCommentModel(
            comment: '',
            userProfilePic: '',
            userName: '',
            commentTime: DateTime.now(),
          ),
          ReelCommentModel(
            comment: '',
            userProfilePic: '',
            userName: '',
            commentTime: DateTime.now(),
          ),
        ]),
  ];
  @override
  void onInit() {
    // update(["video"]);
    super.onInit();
  }

  void onPageChange(int? index) {
    selectedIndex = index!;
    print(index);
    update(["pag;eView"]);
  }

  //-----------------like***************
  void redHart() {
    hart = !hart;
    update(["roshan"]);
  }

  void vRedHart() {
    vHart = !vHart;
    update(["vishal"]);
  }

  //----------------------book---------------------
  void bookMark() {
    book = !book;
    update(["roshan"]);
  }

  void vBookMark() {
    vBook = !vBook;
    update(["vishal"]);
  }

  void openBottomSheet() {
    Get.bottomSheet(
      Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Comment',
              style: TextStyle(fontSize: 18),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Close'),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  void openBottomSheetHome() {
    Get.bottomSheet(
      Column(
        children: [
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Close'),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
