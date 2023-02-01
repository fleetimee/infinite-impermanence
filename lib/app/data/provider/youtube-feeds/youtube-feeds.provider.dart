import 'package:http/http.dart' as http;

import 'package:webfeed/webfeed.dart';

class VideoProvider {
  final httpClient = http.Client();

  Future<RssFeed> fetchVideo() async {
    try {
      final response = await httpClient.get(
        Uri.parse('https://rss.app/feeds/ihntzKHbJr3VqCAn.xml'),
      );
      if (response.statusCode == 200) {
        var channel = RssFeed.parse(response.body);
        return channel;
      } else {
        throw Exception('Failed to load url');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
