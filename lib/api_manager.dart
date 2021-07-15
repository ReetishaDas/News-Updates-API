import 'dart:convert';
import 'package:flutter_assignment/strings.dart';
import 'package:http/http.dart' as http;
import 'strings.dart';
import 'news_info.dart';

class ApiManager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var newsModel;
    try {
      var response = await client.get(Strings.finalurl);
      if (response.statusCode == 200) {
        var jsonBody = response.body;
        var jsonMap = json.decode(jsonBody);
        newsModel = Welcome.fromJson(jsonMap);
      }
    } catch (e) {
      return newsModel;
    }
    return newsModel;
  }
}
