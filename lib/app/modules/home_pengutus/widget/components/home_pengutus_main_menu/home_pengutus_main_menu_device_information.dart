// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';

class PengutusDeviceInformation extends StatelessWidget {
  const PengutusDeviceInformation({
    super.key,
    required this.homeCtrl,
  });

  final HomeController homeCtrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              const Icon(
                FontAwesomeIcons.check,
                color: GFColors.SUCCESS,
              ),
              const SizedBox(
                width: 8,
              ),
              Obx(() => SizedBox(
                    width: 400,
                    child: Text(
                      'Running on ${homeCtrl.brandName} ${homeCtrl.productName} ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Obx(() => homeCtrl.address.value == 'Getting address'
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const Icon(
                      FontAwesomeIcons.locationDot,
                      color: GFColors.DANGER,
                    )),
              const SizedBox(
                width: 8,
              ),
              Obx(() => homeCtrl.address.value == 'Getting address'
                  ? SizedBox(
                      child: Row(
                        children: const [
                          Text(
                            'Getting address',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      width: 400,
                      child: Text(
                        'You are at ${homeCtrl.address}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Obx(() => homeCtrl.mainBranch.value == '...' &&
                      homeCtrl.helperBranch.value == '...'
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const Icon(
                      FontAwesomeIcons.building,
                      color: GFColors.INFO,
                    )),
              const SizedBox(
                width: 8,
              ),
              Obx(() => homeCtrl.mainBranch.value == '...' &&
                      homeCtrl.helperBranch.value == '...'
                  ? SizedBox(
                      child: Row(
                        children: const [
                          Text(
                            '...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      width: 400,
                      child: Text(
                        '${homeCtrl.mainBranch} / ${homeCtrl.helperBranch}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )),
            ],
          ),
        ),
      ],
    );
  }
}
