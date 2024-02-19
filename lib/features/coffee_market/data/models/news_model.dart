

// A model class to represent a news article
class News {
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  const News({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });

  // A factory constructor to create a News object from a JSON string
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
    );
  }

  // A method to convert the News object to a JSON string
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
    };
  }
}
