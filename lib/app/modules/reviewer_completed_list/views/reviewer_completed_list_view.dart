import 'package:akm/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';

import '../controllers/reviewer_completed_list_controller.dart';

class ReviewerCompletedListView
    extends GetView<ReviewerCompletedListController> {
  const ReviewerCompletedListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudah Direview'),
      ),
      body: Obx(
        () => controller.isMyCompletedReviewProcessing.value
            ? const Align(
                alignment: Alignment.center,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                reverse: true,
                itemCount: controller.listMyCompletedReview.length,
                itemBuilder: (context, index) {
                  var reviewed =
                      controller.listMyCompletedReview[index].status ==
                          'REVIEWED';
                  var done =
                      controller.listMyCompletedReview[index].status == 'DONE';
                  var rejected =
                      controller.listMyCompletedReview[index].status ==
                          'REJECTED';

                  return Container(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.PENGAJUAN_DETAIL,
                            arguments:
                                controller.listMyCompletedReview[index].id!);
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 80.0,
                                height: 80.0,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://user-images.githubusercontent.com/45744788/216513919-c19cd833-556b-4aa3-8120-90a86843d487.png",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: GFBadge(
                                              size: GFSize.LARGE,
                                              text: reviewed
                                                  ? 'DIREVIEW'
                                                  : done
                                                      ? 'DITERIMA'
                                                      : rejected
                                                          ? 'DITOLAK 🤣'
                                                          : '',
                                              color: reviewed
                                                  ? Colors.orange
                                                  : done
                                                      ? Colors.green
                                                      : rejected
                                                          ? Colors.red
                                                          : Colors.grey,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            DateFormat('EEEE dd MMM yyyy')
                                                .format(DateTime.parse(
                                                    controller
                                                        .listMyCompletedReview[
                                                            index]
                                                        .tglReview
                                                        .toString())),
                                            style: const TextStyle(
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            controller
                                                .listMyCompletedReview[index]
                                                .debitur
                                                .peminjam1,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            controller
                                                .listMyCompletedReview[index]
                                                .id,
                                            style: const TextStyle(
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
