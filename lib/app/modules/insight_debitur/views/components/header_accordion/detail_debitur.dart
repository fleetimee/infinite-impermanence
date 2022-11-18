// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';

class HeaderDetailDebitur extends StatelessWidget {
  const HeaderDetailDebitur({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final InsightDebiturController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: TabBar(
        controller: controller.tabController,
        // give the indicator a decoration (color and border radius)
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          color: primaryColor,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: primaryColor,
        tabs: [
          // first tab [you can add an icon using the icon property]
          Tab(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(
                  child: Icon(
                    FontAwesomeIcons.accessibleIcon,
                    size: 28,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Detail Debitur',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
