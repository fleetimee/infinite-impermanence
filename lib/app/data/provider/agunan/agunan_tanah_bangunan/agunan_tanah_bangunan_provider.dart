import 'package:http/http.dart' as http;

class AgunanTanahBangunanProvider {
  final httpClient = http.Client();

  // TODO: Add Tanah dan Bangunan API from backend

  // Future<List<FormTanah>> fetchAgunanTanahBangunan(int id) async {
  //   try {
  //     final response = await httpClient.get(
  //       Uri.parse('${baseUrl}agunan/$id/agunan-tanah-bangunan/'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //       },
  //     );
  //     debugPrint(response.body);
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //       debugPrint(data.toString());
  //       return (data as List).map((e) => FormTanah.fromJson(e)).toList();
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (e) {
  //     return Future.error(e);
  //   }
  // }
}
