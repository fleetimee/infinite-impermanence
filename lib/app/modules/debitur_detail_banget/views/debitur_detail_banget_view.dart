// // ignore_for_file: override_on_non_overriding_member

// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/debitur_detail_banget_controller.dart';

// class DebiturDetailBangetView extends GetView<DebiturDetailBangetController> {
//   DebiturDetailBangetView({Key? key}) : super(key: key);

//   final data = Get.arguments;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('DebiturDetailBangetView'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Text(
//           data.toString(),
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

import 'package:akm/app/common/style.dart';
import 'package:akm/app/models/debtor.dart';
import 'package:akm/app/models/debtor_details.dart';
import 'package:akm/app/modules/debitur_detail_banget/controllers/debitur_detail_banget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class DebiturDetailBangetView extends StatefulWidget {
  const DebiturDetailBangetView({Key? key}) : super(key: key);

  @override
  State<DebiturDetailBangetView> createState() =>
      _DebiturDetailBangetViewState();
}

class _DebiturDetailBangetViewState extends State<DebiturDetailBangetView> {
  final data = Get.arguments;
  final controller = Get.put(DebiturDetailBangetController());

  Debtor debtor = Debtor();
  DebtorDetails debtorDetails = DebtorDetails();

  @override
  void initState() {
    super.initState();
    controller.detailsDebtor(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DebiturDetailBangetView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => controller.loadingFetch.value
              ? Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 400,
                  child: LiquidLinearProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation(primaryColor),
                    backgroundColor: Colors.grey,
                    center: Text(
                      "Mencari debitur...",
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : GetBuilder<DebiturDetailBangetController>(
                  init: controller,
                  builder: (_) => Column(
                    children: [
                      Text(
                        data.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        controller.debtorDetails.peminjam1.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
