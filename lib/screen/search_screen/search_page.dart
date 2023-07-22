import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screen/search_screen/search_contoller.dart';
import 'package:instagram/screen/search_screen/search_page_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchScreenController());
    return Scaffold(
      body: searchBody(),
    );
  }
}
