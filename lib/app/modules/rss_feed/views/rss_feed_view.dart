import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/rss_feed_controller.dart';

class RssFeedView extends GetView<RssFeedController> {
  const RssFeedView({Key? key}) : super(key: key);

  Future<void> launchURL(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webOnlyWindowName: '_blank',
      webViewConfiguration: const WebViewConfiguration(
        enableJavaScript: true,
      ),
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Terbaru'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => controller.isDataLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: Scrollbar(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: controller.rss.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // Split String url to get id
                              final url = controller.rss[index].link.toString();

                              // Make a list of id
                              List<String> parts = url.split("id=");

                              // Get id from list
                              String id = parts[1];

                              launchURL(Uri.parse(
                                  'https://www.bpddiy.co.id/berita$id.html'));
                            },
                            child: Card(
                              color: secondaryColor,
                              elevation: 10,
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(10.0),
                                            height: 30.0,
                                            width: 30.0,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  spreadRadius: 2,
                                                  blurRadius: 3,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ],
                                              image: const DecorationImage(
                                                image: NetworkImage(
                                                  "https://i.ibb.co/QrTHd59/woman.jpg",
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(
                                                  12.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12.0,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.rss[index].title,
                                                  style: const TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 4.0,
                                                ),
                                                Row(
                                                  children: const [
                                                    Text(
                                                      "Admin",
                                                      style: TextStyle(
                                                        fontSize: 10.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Text(
                                                      "1 hour ago",
                                                      style: TextStyle(
                                                        fontSize: 10.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Icon(
                                            Icons.more_horiz,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        controller.rss[index].description,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(),
                                      ),
                                    ),
                                    Container(
                                      height: 200.0,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            "https://asbanda.org/upload/blog_asbanda_20191109022654.jpg",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons.thumb_up,
                                                  size: 20.0,
                                                ),
                                                SizedBox(
                                                  width: 4.0,
                                                ),
                                                Text(
                                                  "10",
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12.0,
                                          ),
                                          SizedBox(
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons.chat_bubble_outline,
                                                  size: 20.0,
                                                ),
                                                SizedBox(
                                                  width: 4.0,
                                                ),
                                                Text(
                                                  "10",
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.share,
                                            size: 20.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
