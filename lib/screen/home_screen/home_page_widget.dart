import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:instagram/common/common_size_box.dart';
import 'package:instagram/screen/home_screen/home_controller.dart';
import 'package:instagram/utils/asset_res.dart';
import 'package:instagram/utils/color_res.dart';
import 'package:instagram/utils/string_res.dart';
import 'package:readmore/readmore.dart';
import 'package:reels_viewer/reels_viewer.dart';

AppBar homePageAppBar() {
  return AppBar(
    backgroundColor: ColorsRes.white,
    elevation: 0,
    title: Image.asset(AssetRes.instagramColorText, scale: 3),
    actions: [
      Image.asset(AssetRes.massege, scale: 6),
      const SizedBox(width: 5)
    ],
  );
}

Widget homePageBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        story(),
        post(AssetRes.roshan, StringRes.roshan, StringRes.roshanSub),
        // Image.asset(AssetRes.roshan),
        roshan(),
        roshanRow(),
        readMoreRow(),
        commentText(),
        post(AssetRes.vishal, StringRes.vishal, StringRes.vishalSub),
        multiImage(),
        vishalRow(),
        readMoreRow(),
        commentText(),
      ],
    ),
  );
}

Widget roshan() {
  return GetBuilder<HomeController>(
    id: "video",
    builder: (controller) => SizedBox(
      height: Get.height * 0.6,
      width: Get.width,
      child: ReelsViewer(
        reelsList: controller.reelsList,
        onIndexChanged: (p0) {
          return 0;
        },
        showAppbar: false,
        showVerifiedTick: false,
        onComment: (p0) {},
      ),
    ),
  );
}

Widget multiImage() {
  return SizedBox(
    width: Get.width,
    height: Get.height * 0.6,
    child: Stack(
      children: [
        GetBuilder<HomeController>(
          id: "pageView",
          builder: (controller) {
            return PageView(
              allowImplicitScrolling: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: controller.onPageChange,
              children: AssetRes.listImage.map((e) {
                return InstaImageViewer(
                  child: Image(
                    width: Get.width,
                    repeat: ImageRepeat.noRepeat,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.contain,
                    image: Image.asset(e).image,
                  ),
                );
              }).toList(),
            );
          },
        ),
        const Positioned(
          right: 20,
          top: 5,
          child: Icon(
            Icons.file_copy_outlined,
            size: 30,
            color: ColorsRes.black,
          ),
        ),
        const Positioned(
            bottom: 5, left: 5, child: Icon(Icons.account_circle, size: 30))
      ],
    ),
  );
}

Widget post(String image, String title, String subTitle) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(image),
            ),
            horizontalSizeBox(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  subTitle,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
            const Spacer(),
            horizontalSizeBox(10),
            const Icon(Icons.more_vert),
          ],
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}

//----------------------------roshan-------------------

Widget roshanRow() {
  return GetBuilder<HomeController>(
    id: "roshan",
    builder: (controller) {
      return likeRow(
          () => controller.redHart(),
          controller.hart
              ? const Icon(Icons.favorite, size: 25, color: Colors.red)
              : const Icon(Icons.favorite_border_outlined, size: 25),
          () => controller.bookMark(),
          controller.book
              ? const Icon(Icons.bookmark, size: 25)
              : const Icon(Icons.bookmark_border, size: 25));
    },
  );
}

//------------------------vishal Row------------------------------------
Widget vishalRow() {
  return GetBuilder<HomeController>(
    id: "vishal",
    builder: (controller) {
      return likeRow(
          () => controller.vRedHart(),
          controller.vHart
              ? const Icon(Icons.favorite, size: 25, color: Colors.red)
              : const Icon(Icons.favorite_border_outlined, size: 25),
          () => controller.vBookMark(),
          controller.vBook
              ? const Icon(Icons.bookmark, size: 25)
              : const Icon(Icons.bookmark_border, size: 25));
    },
  );
}

//-----------------------like row---------------------------------
Widget likeRow(void Function()? onPressed, Icon iconData,
    void Function()? onPressedBook, Icon iconBook) {
  return Row(
    children: [
      IconButton(onPressed: onPressed, icon: iconData),
      GetBuilder<HomeController>(
        builder: (controller) {
          return GestureDetector(
            onTap: () => controller.openBottomSheet(),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                EvaIcons.messageCircleOutline,
                size: 25,
              ),
            ),
          );
        },
      ),
      GetBuilder<HomeController>(
        builder: (controller) {
          return GestureDetector(
            onTap: () => controller.openBottomSheetHome(),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                EvaIcons.paperPlaneOutline,
                size: 25,
              ),
            ),
          );
        },
      ),
      const Spacer(),
      IconButton(onPressed: onPressedBook, icon: iconBook),
      const SizedBox(width: 10)
    ],
  );
}

///   -------------------------------------- Read More Row ----------------------------------------------------  ///

Widget readMoreRow() {
  return const Padding(
    padding: EdgeInsets.all(13.0),
    child: ReadMoreText(
      StringRes.readMoreText,
      trimLines: 2,
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read more',
      trimExpandedText: '',
      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
  );
}

Widget commentText() {
  return const Padding(
    padding: EdgeInsets.only(top: 10, left: 13, bottom: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(StringRes.commentstext,
            style: TextStyle(color: ColorsRes.black45)),
        Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(
                AssetRes.roshan,
              ),
            ),
            SizedBox(width: 10),
            Text(StringRes.roshan, style: TextStyle(color: ColorsRes.black45)),
            Spacer(),
            Text('😍💬'),
            SizedBox(width: 20),
          ],
        ),
        SizedBox(height: 10),
        Text(
          StringRes.timeText,
          style: TextStyle(color: ColorsRes.black45),
        ),
      ],
    ),
  );
}

Widget story() {
  return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AssetRes.listImage.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: ColorsRes.colorList),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: CircleAvatar(
                            backgroundImage:
                                AssetImage(AssetRes.listImage[index]),
                            radius: 35),
                      ),
                    ),
                  ),
                ),
              ),
              Text(AssetRes.storyName[index])
            ],
          );
        },
      ));
}
