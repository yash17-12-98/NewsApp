import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:newsapitask/Model/NewsModel.dart';
import 'package:newsapitask/services/Services.dart';

class NewsViewModel{
   NewsModel _newsModel;

  NewsViewModel(this._newsModel);

  String? get author{
    return this._newsModel.author;
  }

  String? get title {
    return this._newsModel.title;

  }

  String? get description {
    return this._newsModel.desc;
  }

  String? get url {
    return this._newsModel.url;
  }

  String? get urlToImg{
    return this._newsModel.urlToImg;
  }

  String? get content{
    return this._newsModel.content;
  }
  String? get publishedAt{
    return this._newsModel.publishedAt;
  }

  String? get sourceName {
    return this._newsModel.sourceName;
  }
}

class ListNewsViewModel with ChangeNotifier{

  List<NewsViewModel>? list;

  Future<void> fetchNews() async {
    final apiResult = await Services().fetchData();

    this.list = apiResult.map((e) => NewsViewModel(e)).toList();
    notifyListeners();
  }
}