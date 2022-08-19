// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/printing/views/printing_detail_view_view.dart';
import 'package:akm/app/widget/drawer.dart';
import '../controllers/printing_controller.dart';

class PrintingView extends GetView<PrintingController> {
  const PrintingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: const Text('Invoices'),
      ),
      body: ListView(
        children: [
          ...controller.invoices.map(
            (e) => ListTile(
              title: Text(e.name),
              subtitle: Text(e.customer),
              trailing: Text('\$${e.totalCost().toStringAsFixed(2)}'),
              onTap: () {
                // Go to detail page with data
                Get.to(
                  () => PrintingDetailViewView(),
                  arguments: e,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
