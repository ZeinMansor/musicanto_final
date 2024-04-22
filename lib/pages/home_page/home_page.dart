import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicanto/components/section_header.dart';
import 'package:musicanto/widgets/playlist_card.dart';

import '../../controllers/home_page_controller.dart';
import 'widget/custom_appbar.dart';
import 'widget/custom_bottom_navbar.dart';
import 'widget/custom_search_bar.dart';
import 'widget/trending_music.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomSearchField(),
              const TrendingMusic(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SectionHeader(title: "Playlists"),
                    GetBuilder<HomePageController>(builder: (controller) {
                      return ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 20.0),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.playlists.length,
                        itemBuilder: ((context, index) {
                          return PlaylistCard(
                              playlists: controller.playlists[index]);
                        }),
                      );
                    })
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
