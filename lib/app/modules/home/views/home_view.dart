import 'package:akm/app/modules/home/views/components/home_menu.dart';
import 'package:akm/app/widget/drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: (ModalRoute.of(context)?.canPop ?? false)
                ? const BackButton()
                : null,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // color: secondaryColor,
                  fontSize: 40,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
              ),
              background: Obx(
                () => Image.asset(
                  controller.isDarkModeEnabled.value
                      ? 'assets/images/home/appbar_light.jpg'
                      : 'assets/images/home/appbar_dark.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: HomeMenu(),
          ),
        ],
      ),
    );
  }
}
