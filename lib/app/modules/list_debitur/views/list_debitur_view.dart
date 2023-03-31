// 🐦 Flutter imports:
import 'package:akm/app/modules/list_debitur/widget/list_debitur_action_buttons.dart';
import 'package:akm/app/modules/list_debitur/widget/list_debitur_filter_fab.dart';
import 'package:akm/app/modules/list_debitur/widget/list_debitur_the_list.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import '../controllers/list_debitur_controller.dart';

class ListDebiturView extends GetView<ListDebiturController> {
  const ListDebiturView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue,
          Colors.blue.shade900,
        ],
      ),
      appBar: AppBar(
        title: Obx(() => controller.isSearchPressed.value == true
            ? const Text('')
            : const Text('Search')),
        actions: listDebiturActionsButtons(
          context,
          controller,
        ),
      ),
      body: ListDebiturListView(
        controller: controller,
      ),
      floatingActionButton: ListDebiturFilterFab(
        controller: controller,
      ),
    );
  }
}

class BpdDiyLoader extends StatelessWidget {
  const BpdDiyLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GFLoader(
          type: GFLoaderType.custom,
          child: ClipOval(
              child: const Image(
            image: AssetImage(
              'assets/images/home/bpdlogoo.png',
            ),
            height: 250,
          )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(duration: 1200.ms, color: primaryColor)
                  .animate() // this wraps the previous Animate in another Animate
                  .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                  .slide()),
        ),
      ],
    );
  }
}
