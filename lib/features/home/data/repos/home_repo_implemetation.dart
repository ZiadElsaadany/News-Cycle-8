import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:news_api_cycle_8/core/errors/failure.dart';
import 'package:news_api_cycle_8/features/home/data/models/new_model.dart';
import 'package:news_api_cycle_8/features/home/data/repos/home_Repo.dart';
import 'package:http/http.dart' as http;

class HomeRepoImplementationFromApi implements HomeRepo {
  @override
  Future<Either<Failure, List<NewModel>>> getTopHeadline() async {
    // TODO: implement getTopHeadline

    //https://newsapi.org/v2/top-headlines?apiKey=9273e8c3654242b380ed9fdbba8f8254&category=technology
    try {
      var response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?apiKey=9273e8c3654242b380ed9fdbba8f8254&category=technology"));

      print(jsonDecode(response.body).toString());

      /// jsonDecode(response.body)["articles"]
      /// convert response to list<NewModel>
      for (var article in jsonDecode(response.body)["articles"]) {
        // article  -- >  {
        //             "source": {
        //                 "id": null,
        //                 "name": "MacRumors"
        //             },
        //             "author": "Tim Hardwick",
        //             "title": "'Noticeably Thinner' Apple Watch Series 10 to Eventually Get Sleep Apnea Detection - MacRumors",
        //             "description": "The Apple Watch Series 10 will include a new sleep apnea detection feature, but it may not be available as soon as the new model launches, according...",
        //             "url": "https://www.macrumors.com/2024/09/06/apple-watch-10-sleep-apnea/",
        //             "urlToImage": "https://images.macrumors.com/t/pVBvl-VPaeZH8xg2tqA-k2Lsl-w=/1960x/article-new/2023/08/apple-watch-series-9-display.jpeg",
        //             "publishedAt": "2024-09-06T11:42:09Z",
        //             "content": "The Apple Watch Series 10 will include a new sleep apnea detection feature, but it may not be available as soon as the new model launches, according to Bloomberg's Mark Gurman.\r\nSleep apnea detection… [+1553 chars]"
        //         },

        NewModel newModel = NewModel(
            title: article["title"],
            desc: article["description"],
            content: article["content"],
            urlToImage: article["urlToImage"],
            url: article["url"],
            publishedAt: article["publishedAt"],
            sourceModel: SourceModel(id: article["source"]["id"], name:  article["source"]["name"]));
      }
      return right(r);
    } catch (e) {}
  }
}
