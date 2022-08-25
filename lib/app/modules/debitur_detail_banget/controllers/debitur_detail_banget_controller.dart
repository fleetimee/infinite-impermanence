import 'package:akm/app/models/debtor_details.dart';
import 'package:akm/app/service/debtor_details_service.dart';
import 'package:get/get.dart';

class DebiturDetailBangetController extends GetxController {
  final count = 0.obs;
  final loadingFetch = false.obs;

  DebtorDetails debtorDetails = DebtorDetails();

  final data = Get.arguments;

  void detailsDebtor(int id) async {
    loadingFetch.value = true;

    final api = DebtorDetailsService();

    Future.delayed(const Duration(seconds: 2), () async {
      final response = await api.getDebtorDetails(id);
      debtorDetails = response;
      loadingFetch.value = false;
    });

    update();
  }
}
