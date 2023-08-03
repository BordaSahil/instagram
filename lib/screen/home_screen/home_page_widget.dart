import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
import 'package:search_bar_animated/search_bar_animated.dart';

AppBar homePageAppBar() {
  return AppBar(
    backgroundColor: ColorsRes.white,
    elevation: 0,
    leading: Image.asset(
      AssetRes.instagramLogo,
      scale: 3.5,
    ),
    title: AnimatedSearchBar(
      shadow: const [
        BoxShadow(
          color: Colors.black38,
          blurRadius: 5,
        ),
      ],
      backgroundColor: Colors.white,
      buttonColor: Colors.black,
      width: Get.width * 0.7,
      submitButtonColor: Colors.black,
      textStyle: const TextStyle(color: Colors.black),
      buttonIcon: const Icon(
        Icons.search,
      ),
      duration: const Duration(milliseconds: 1000),
      submitIcon: const Icon(Icons.cancel),
      animationAlignment: AnimationAlignment.left,
      onSubmit: () {
        /* setState(() {
            value = textController.text;
          });*/
      },
      searchList: HomeController.searchBarList,
      searchQueryBuilder: (query, list) => list.where((item) {
        return item!.toString().toLowerCase().contains(query.toLowerCase());
      }).toList(),
      // textController: textController,
      overlaySearchListItemBuilder: (dynamic item) => Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          item,
          style: const TextStyle(fontSize: 15, color: Colors.black),
        ),
      ),
      /* onItemSelected: (dynamic item) {
          textController.value = textController.value.copyWith(
            text: item.toString(),
          );
        },*/
      overlaySearchListHeight: 100,
    ),
    actions: [
      Image.asset(AssetRes.massege, scale: 6),
      const SizedBox(width: 5)
    ],
  );
}

Widget homePageBody() {
  return ListView(
    physics: const BouncingScrollPhysics(),
    children: [
      // story(),
      post(AssetRes.vishal, StringRes.vishal, StringRes.vishalSub),
      multiImage(),
      vishalRow(),
      readMoreRow(),
      commentText(),
      post(AssetRes.akshayBhai, StringRes.akshayBhai, StringRes.sudhirSub),
      Image.asset(AssetRes.akshayBhai),
      akshayRow(),
      readMoreRow(),
      commentText(),
      post(AssetRes.roshan, StringRes.roshan, StringRes.roshanSub),
      roshan(),
      roshanRow(),
      readMoreRow(),
      commentText(),
    ],
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
        GetBuilder<HomeController>(
          id: "count",
          builder: (controller) {
            return Positioned(
                right: 20,
                top: 5,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsRes.black),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 8, bottom: 8),
                    child: Text(
                      "${controller.selectedIndex}/6",
                      style: const TextStyle(color: ColorsRes.white),
                    ),
                  ),
                ));
          },
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 23,
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
              ? const Icon(Icons.favorite, size: 28, color: Colors.red)
              : const Icon(Icons.favorite_border_outlined, size: 28),
          () => controller.bookMark(),
          controller.book
              ? const Icon(Icons.bookmark, size: 28)
              : const Icon(Icons.bookmark_border, size: 28));
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
              ? const Icon(Icons.favorite, size: 28, color: Colors.red)
              : const Icon(Icons.favorite_border_outlined, size: 28),
          () => controller.vBookMark(),
          controller.vBook
              ? const Icon(Icons.bookmark, size: 28)
              : const Icon(Icons.bookmark_border, size: 28));
    },
  );
}

Widget akshayRow() {
  return GetBuilder<HomeController>(
    id: "akshay",
    builder: (controller) {
      return likeRow(
          () => controller.aRedHart(),
          controller.akshay
              ? const Icon(Icons.favorite, size: 28, color: Colors.red)
              : const Icon(Icons.favorite_border_outlined, size: 28),
          () => controller.aBookMark(),
          controller.aBook
              ? const Icon(Icons.bookmark, size: 28)
              : const Icon(Icons.bookmark_border, size: 28));
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
                size: 28,
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
                size: 28,
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
    height: Get.height * 0.15,
    child: ListView.builder(
      itemCount: AssetRes.listImage.length + 1,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: profileStory(),
              ),
              const Text("Story")
            ],
          );
        }
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
                              AssetImage(AssetRes.listImage[index - 1]),
                          radius: 35),
                    ),
                  ),
                ),
              ),
            ),
            Text(AssetRes.storyName[index - 1])
          ],
        );
      },
    ),
  );
}

Widget profileStory() {
  return Center(
    child: Stack(clipBehavior: Clip.none, children: [
      const CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage(AssetRes.sudhir),
      ),
      Positioned(
        right: 0,
        bottom: 4,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 18),
        ),
      ),
    ]),
  );
}
