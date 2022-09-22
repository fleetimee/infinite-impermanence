// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
 import '../../../../../common/style.dart';
 import '../../../../../routes/app_pages.dart';

class SecondRow extends StatelessWidget {
  const SecondRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Material(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
          child: InkWell(
            onTap: () => Get.offAllNamed(Routes.PENGHASILAN_TETAP),
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
                const Positioned(
                  right: 25,
                  bottom: 40,
                  child: Icon(
                    Icons.currency_exchange_sharp,
                    color: secondaryColor,
                    size: 50,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: 20,
                  child: Text(
                    'Fixed',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Material(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
          child: InkWell(
            onTap: () => Get.offAllNamed(
              Routes.PENGHASILAN_XTETAP,
            ),
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
                const Positioned(
                  right: 25,
                  bottom: 40,
                  child: Icon(
                    Icons.account_balance_wallet,
                    color: secondaryColor,
                    size: 50,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: 12,
                  child: Text(
                    'Non - Fixed',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Material(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
          child: InkWell(
            onTap: () => Get.offAllNamed(Routes.UPLOADS),
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
                const Positioned(
                  right: 25,
                  bottom: 40,
                  child: Icon(
                    Icons.upload_file,
                    color: secondaryColor,
                    size: 50,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    'Upload',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
