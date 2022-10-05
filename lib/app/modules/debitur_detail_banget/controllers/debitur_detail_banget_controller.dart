// 📦 Package imports:
import 'package:faker_dart/faker_dart.dart';
import 'package:get/get.dart';
import 'package:nekos/nekos.dart';

// 🌎 Project imports:
import '../../../models/debtor_details.dart';
import '../../../service/debtor_details_service.dart';

class DebiturDetailBangetController extends GetxController {
  final faker = Faker.instance;
  final count = 0.obs;
  final loadingFetch = false.obs;

  Future<String> img = Nekos().avatar();

  DebtorDetails debtorDetails = DebtorDetails();

  final data = Get.arguments;

  void detailsDebtor(int id) async {
    loadingFetch.value = true;

    final api = DebtorDetailsService();

    Future.delayed(const Duration(seconds: 1), () async {
      final response = await api.getDebtorDetails(id);
      debtorDetails = response;
      loadingFetch.value = false;
    });

    update();
  }
}
