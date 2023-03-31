// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/home/models/menu_grid.dart';
import 'package:akm/app/modules/home/views/components/home_menu.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:

class HomeMainPage extends StatelessWidget {
  HomeMainPage({super.key});

  final List<String> imageList = [
    "assets/images/home/image1.jpg",
    "assets/images/home/image2.jpg",
    "assets/images/home/image3.jpg",
    "assets/images/home/image4.jpg",
    "assets/images/home/image5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          leading: (ModalRoute.of(context)?.canPop ?? false)
              ? const BackButton()
              : null,
          pinned: true,
          snap: false,
          floating: false,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Center(
              child: GFCarousel(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 7),
                hasPagination: true,
                activeIndicator: Colors.white,
                passiveIndicator: Colors.white54,
                enlargeMainPage: true,
                pagerSize: 10,
                viewportFraction: 1.0,
                items: imageList.map(
                  (url) {
                    return Center(
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          child: Image.asset(
                            url,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
                // onPageChanged: (index) {
                //   controller.pageChanged(index);

                // },
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: HomeMenu(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                itemCount: menuGridList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => menuGridList[index].onTap(),
                          child: Card(
                            color: Colors.blue[900]?.withOpacity(0.9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                            child: SizedBox(
                              height: 50,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      menuGridList[index].menuIcon,
                                      height: 50,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        menuGridList[index].menuName,
                        style: const TextStyle(
                          fontSize: 16,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
