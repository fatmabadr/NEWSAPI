import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api/Article.dart';

class API{

  static Future<List<Article>> getArticles(String link) async {
    var uri = Uri.parse(link);

    final response = await http.get(uri);

    Map<String,dynamic> json=jsonDecode(response.body);

    List<dynamic> body=json['articles'];

    return  body.map((dynamic e) => Article.fromJson(e)).toList();
  }

}