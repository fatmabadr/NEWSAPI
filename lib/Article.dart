class Article {

  String? title;
  String? urlToImage;
  String? description;
  String? url;
  String? publishedAt;


  Article({ this.title,this.urlToImage,this.url,this.publishedAt,this.description});

  Article.fromJson(Map<String, dynamic> json) {

    title = json['title'];
    urlToImage = json['urlToImage'];
    description = json['description'];
    url = json['url'];
    publishedAt = json['publishedAt'];


  }
}