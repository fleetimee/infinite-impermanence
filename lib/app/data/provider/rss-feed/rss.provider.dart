import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:webfeed/webfeed.dart';

class RssProvider {
  final httpClient = http.Client();

  Future<RssFeed> fetchRss() async {
    try {
      final response = await httpClient.get(
        Uri.parse('https://www.bpddiy.co.id/index.php?page=rss&mode=berita'),
      );
      if (response.statusCode == 200) {
        debugPrint(response.body);
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
