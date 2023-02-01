import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/youtube_feed_controller.dart';

class YoutubeFeedView extends GetView<YoutubeFeedController> {
  const YoutubeFeedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videos'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'From Youtube',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => controller.isDataLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: controller.videos.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        controller.videos[index].media!
                                            .contents!.first.url!,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            DateFormat.yMMMd().format(
                                              controller.videos[index].pubDate!,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        controller.videos[index].title!,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 12.0,
                                            backgroundColor: Colors.grey[200],
                                            backgroundImage: const NetworkImage(
                                              "https://i.ibb.co/sqRTGfL/photo-1514543250559-83867827ecce-ixlib-rb-1-2.jpg",
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8.0,
                                          ),
                                          const Expanded(
                                            child: Text(
                                              "Admin",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.orange,
                                              ),
                                            ),
                                          ),
                                          const Text(
                                            "Watch on Youtube",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
