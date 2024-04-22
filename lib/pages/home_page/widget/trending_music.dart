import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_page_controller.dart';

class TrendingMusic extends GetView<HomePageController> {
  const TrendingMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trending Music",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.white),
                ),
                const Text("View More")
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: FutureBuilder(
                future: controller.getSongs(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    ));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.playSong();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                              image: AssetImage(snapshot
                                                  .data![index].thumbnailUrl),
                                              fit: BoxFit.cover)),
                                    ),
                                    Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.37,
                                      margin:
                                          const EdgeInsets.only(bottom: 10.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: Colors.white.withOpacity(0.8)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                snapshot.data![index].name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color:
                                                            Colors.deepPurple,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Text(
                                                snapshot.data![index].type,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: Colors.deepPurple
                                                            .shade200,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          const Icon(
                                            Icons.play_circle,
                                            color: Colors.deepPurple,
                                          )
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
