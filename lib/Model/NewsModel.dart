class NewsModel {
  String? sourceName;
  String? author;
  String? title;
  String? desc;
  String? url;
  String? urlToImg;
  String? publishedAt;
  String? content;


  NewsModel(
      {this.sourceName,
        this.author,
        this.title,
        this.desc,
        this.url,
        this.urlToImg,
        this.publishedAt,
        this.content,});

  NewsModel.fromJson(Map<String, dynamic> json) {
    sourceName = json['source']['name'];
    author = json['author'];
    title = json['title'];
    desc = json['description'];
    url = json['url'];
    urlToImg = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source']['name'] = this.sourceName;
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.desc;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImg;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;

    return data;
  }
}
