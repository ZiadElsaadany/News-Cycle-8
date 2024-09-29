import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_cycle_8/features/home/data/models/new_model.dart';
import 'package:news_api_cycle_8/features/home/data/repos/home_Repo.dart';

import 'get_top_headline_states.dart';

class TopHeadlineCubit extends Cubit<TopHeadlineStates> {
  TopHeadlineCubit(
  {
    required this.homeRepo
}
      ) : super(GetTopHeadlineInitialState());


  final HomeRepo  homeRepo;



  List<NewModel> topHeadlines = [] ;
  ///  sports   technology

  Map<int , List<NewModel>>   mapForNews =  {} ;
  //   0     []

  Future<void>     getTopHeadline(
  {
     String category = "technology",
    int index = 0,
    required List<NewModel> bookmarksList
}
      )  async{
    print("start get top headline");
    emit(GetTopHeadlineLoadingState());
    var result  = await homeRepo.getTopHeadline(
      category: category
    );
    result.fold( ( left) {
      print("result is: ${left.message}   ");

      emit(GetTopHeadlineFailureState(
        errorMessage: left.message
      ));

    },(right) {
      topHeadlines = right;


/**
 *
 *  {
 *    0: [NewModel( ) ] ,
 *    1: [NewsMode( ) ],
 *
 *    }
 *
 * **/

      topHeadlines = topHeadlines.map((newsItem) {
        // first new   --> newsItem
        if (bookmarksList.any((bookmark) => bookmark == newsItem)) {
          newsItem.bookMark = true; // Assuming you have a `isBookmarked` field
        }
        return newsItem;
      }).toList();
      mapForNews.addAll({
        index:topHeadlines
      });



      print("result is: $topHeadlines   ");
      emit(GetTopHeadlineSuccessState());

    } );

  }






}
