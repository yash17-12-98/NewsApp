import 'dart:convert';

import 'package:newsapitask/Model/NewsModel.dart';
import 'package:http/http.dart' as http;


class Services{
  Future <List<NewsModel>> fetchData() async {
      String uri = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=44ebb3112c7d498e9d1bffd9564fcb17";
      final response = await http.get(Uri.parse(uri));
      if(response.statusCode == 200){
        final responseJson = json.decode(response.body);

        final article = responseJson['articles'] as List<dynamic>;
        final listResult = article.map((e) => NewsModel.fromJson(e)).toList();

        print("this list result "+ listResult.toString());

        print("this response : "+ article.toString());

        return listResult;
        
      }else {
        throw Exception("Error in fetching data");
      }
  }
}