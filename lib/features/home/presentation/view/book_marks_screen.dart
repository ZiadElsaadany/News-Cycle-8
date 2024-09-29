import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/book_mark_cubit/book_mark_cubit.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/book_mark_cubit/book_mark_states.dart';
import 'package:news_api_cycle_8/features/home/presentation/view/widgets/home/list_view_for_news.dart';

class BookMarksScreen extends StatelessWidget {
  const BookMarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bookMarkCubit = BlocProvider.of<BookMarkCubit>(context);
    return BlocBuilder<BookMarkCubit, BookMarkStates>(
      builder: (context, state) {
        return ListViewForNews(
          news: bookMarkCubit.bookMarks.toSet().toList(),
        );
      },
    );
  }

}


// {
//   "title" :"ziad" ,
// "name": "ziad",
// }
// {
// "title" :"ziad" ,
// "name": "ziad",
// }