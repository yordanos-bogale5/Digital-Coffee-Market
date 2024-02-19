

// This file defines a service for searching news articles.
// This service makes use of the News API.
// More information: https://newsapi.org/

import 'dart:convert';

import 'package:http/http.dart' as http;

/// A service for searching news articles.
class NewsService {
  /// The base URL for the News API.
  static const String _baseUrl = 'https://newsapi.org/v2';

  /// The API key for the News API.
  static const String _apiKey = 'YOUR_API_KEY';

  /// Searches for news articles based on the given query.
  ///
  /// The [query] parameter is the search query.
  ///
  /// The [page] parameter is the page number of the results to be retrieved.
  ///
  /// The [pageSize] parameter is the number of results to be retrieved per page.
  ///
  /// Returns a list of news articles.
  Future<List<NewsArticle>> searchNews(
    String query, {
    int page = 1,
    int pageSize = 10,
  }) async {
    // Construct the URL for the API request.
    var url = Uri.parse('$_baseUrl/everything?q=$query&page=$page&pageSize=$pageSize&apiKey=$_apiKey');

    // Make the API request.
    var response = await http.get(url);

    // Parse the JSON response.
    var json = jsonDecode(response.body);

    // Extract the news articles from the JSON response.
    var articles = json['articles'] as List;

    // Convert the JSON articles into NewsArticle objects.
    var newsArticles = articles.map((article) => NewsArticle.fromJson(article)).toList();

    // Return the list of news articles.
    return newsArticles;
  }
}

/// A news article.
class NewsArticle {
  /// The headline of the news article.
  final String title;

  /// The description of the news article.
  final String description;

  /// The URL of the news article.
  final String url;

  /// The URL of the image associated with the news article.
  final String imageUrl;

  /// The date the news article was published.
  final DateTime publishedAt;

  /// Creates a new NewsArticle object.
  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
  });

  /// Creates a new NewsArticle object from a JSON map.
  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      imageUrl: json['urlToImage'],
      publishedAt: DateTime.parse(json['publishedAt']),
    );
  }
}
