import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/common/common_size_box.dart';
import 'package:instagram/screen/home_screen/home_controller.dart';
import 'package:instagram/utils/asset_res.dart';
import 'package:instagram/utils/color_res.dart';
import 'package:instagram/utils/string_res.dart';
import 'package:readmore/readmore.dart';

/*Widget homePageBody() {
  return CustomScrollView(
    slivers: [
      SliverAppBar(
        leading: const SizedBox(),
        actions: [
          const Icon(Icons.favorite_border_outlined,
              color: ColorsRes.black, size: 30),
          Image.asset(AssetRes.massege, scale: 10),
          const SizedBox(width: 10)
        ],
        snap: false,
        pinned: false,
        floating: false,
        elevation: 0,
        backgroundColor: ColorsRes.white,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: const EdgeInsets.only(left: 8),
          title: Image.asset(AssetRes.instagramText, scale: 3.5),
        ),
      ),
      SliverFillRemaining(
        child:
      ),
    ],
  );
}*/

Widget homePageBody() {
  return SafeArea(
    child: Column(
      children: [
        story(),
        Expanded(
          child: Container(
            width: double.infinity,
            child: Swiper(
              itemCount: 5,
              autoplay: false,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return swiperList;
              },
            ),
          ),
        ),
      ],
    ),
  );
}

List swiperList = [
  singleImage(),
  multiImage(),
];

Widget singleImage() {
  return Column(
    children: [
      post(AssetRes.roshan, StringRes.roshan, StringRes.roshanSub),
      Image.asset(AssetRes.roshan),
      roshanRow(),
      readMoreRow(),
      commentText(),
    ],
  );
}

Widget multiImage() {
  return Column(
    children: [
      post(AssetRes.vishal, StringRes.vishal, StringRes.vishalSub),
      Image.asset(AssetRes.vishal),
      vishalRow(),
      readMoreRow(),
      commentText(),
    ],
  );
}

Widget post(String image, String title, String subTitle) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
              ? const Icon(Icons.favorite, size: 30, color: Colors.red)
              : const Icon(Icons.favorite_border_outlined, size: 30),
          () => controller.bookMark(),
          controller.book
              ? const Icon(Icons.bookmark, size: 30)
              : const Icon(Icons.bookmark_border, size: 30));
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
              ? const Icon(Icons.favorite, size: 30, color: Colors.red)
              : const Icon(Icons.favorite_border_outlined, size: 30),
          () => controller.vBookMark(),
          controller.vBook
              ? const Icon(Icons.bookmark, size: 30)
              : const Icon(Icons.bookmark_border, size: 30));
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
            child: Image.asset(AssetRes.comment, scale: 20),
          );
        },
      ),
      const SizedBox(width: 8),
      GetBuilder<HomeController>(
        builder: (controller) {
          return GestureDetector(
              onTap: () => controller.openBottomSheetHome(),
              child: Image.asset(AssetRes.send, scale: 17));
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
      preDataText: "dosm,cmv ssgbbfh",
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
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: SizedBox(
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
        )),
  );
}
