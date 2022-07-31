import 'package:akm/app/modules/home/views/components/home_menu.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Home'),
              background: Image.asset(
                'assets/images/home/appbar.jpg',
                fit: BoxFit.cover,
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
