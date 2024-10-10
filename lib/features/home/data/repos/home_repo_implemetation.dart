

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:news_api_cycle_8/core/endpoints.dart';
import 'package:news_api_cycle_8/core/errors/failure.dart';
import 'package:news_api_cycle_8/features/home/data/models/new_model.dart';
import 'package:news_api_cycle_8/features/home/data/repos/home_Repo.dart';
import 'package:http/http.dart' as http;

import '../models/source_model.dart';

class HomeRepoImplementationFromApi implements HomeRepo {
  @override
  Future<Either<Failure, List<NewModel>>> getTopHeadline(
      {
        required String category
      }
      ) async {

    List<NewModel> news = [] ;

    //https://newsapi.org/v2/top-headlines?apiKey=9273e8c3654242b380ed9fdbba8f8254&category=technology
    try {
      var response = await http.get(Uri.parse(
          "${EndPoints.baseUrl}${EndPoints.getTopHeadlineEndpoint}?apiKey=${EndPoints.apiKey}&category=$category"));
      
      if(response.statusCode == 200) {
        for (var article in jsonDecode(response.body)["articles"]) {
          NewModel newModel = NewModel(
              title: article["title"],
              desc: article["description"],
              content: article["content"],
              urlToImage: article["urlToImage"],
              url: article["url"],
              publishedAt: article["publishedAt"],
              sourceModel: SourceModel(id: article["source"]["id"], name:  article["source"]["name"]));
          news.add(newModel);
        }
        return right(news);
      }else{

        return left( ApiFailure(message: jsonDecode(response.body)["message"]));

      }


    } catch (e) {
      debugPrint(e.toString());
      return left(ApiFailure(message: "Oops error occurred!"));
    }
  }

  @override
  Future<Either<Failure, List<NewModel>>> searchForNews(
      {
        required String q
      }
      )  async {

    List<NewModel> news = [] ;

    //https://newsapi.org/v2/top-headlines?apiKey=9273e8c3654242b380ed9fdbba8f8254&category=technology
    try {
      var response = await http.get(Uri.parse(
          "${EndPoints.baseUrl}${EndPoints.searchAboutNews}?q=$q&apiKey=${EndPoints.apiKey}"));

      if(response.statusCode == 200) {
        for (var article in jsonDecode(response.body)["articles"]) {
          NewModel newModel = NewModel(
              title: article["title"],
              desc: article["description"],
              content: article["content"],
              urlToImage: article["urlToImage"],
              url: article["url"],
              publishedAt: article["publishedAt"],
              sourceModel: SourceModel(id: article["source"]["id"], name:  article["source"]["name"]));
          news.add(newModel);
        }
        return right(news);
      }else{

        return left( ApiFailure(message: jsonDecode(response.body)["message"]));

      }


    } catch (e) {
      debugPrint(e.toString());
      return left(ApiFailure(message: "Oops error occurred!"));
    }
  }
}
