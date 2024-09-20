import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_api_cycle_8/core/app_colors.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/book_mark_cubit/book_mark_cubit.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/book_mark_cubit/book_mark_states.dart';

import '../../../../data/models/new_model.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({super.key, required this.newModel});

  final NewModel newModel;

  @override
  Widget build(BuildContext context) {
    var bookMarkCubit  =BlocProvider.of<BookMarkCubit>(context);
    return BlocBuilder<BookMarkCubit, BookMarkStates>(
      builder: (context, state) {
        return Column(

          children: [
            CachedNetworkImage(
              imageUrl: newModel.urlToImage ?? "",
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text(newModel.sourceModel.name ?? ""),

            Text(newModel.title ?? "",

              maxLines: 1, overflow:
              TextOverflow.ellipsis,),
            Text(newModel.desc ?? "",
              maxLines: 2,
              overflow:
              TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(newModel.sourceModel.name ?? ""),
                Icon(Icons.date_range),
                Text(convertDate(newModel.publishedAt)),
                Spacer(),
                IconButton(
                  onPressed: () {
                    // newModel.bookMark =!newModel.bookMark;
                    // swap   book marks --> true false


                    bookMarkCubit.changeBookMark(newModel);
                    // bookMarkCubit.addToBookMarks(newModel: newModel);

                  },
                  icon: Icon(Icons.bookmark,

                  color: newModel.bookMark ? AppColors.primaryColor:Colors.grey,
                  ),
                )
              ],
            )

          ],
        );
      },
    );
  }

  String convertDate(dateString) {
    DateTime dateTime = DateTime.parse(dateString);

    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
    // Output: 2024-09-12 – 07:05

    return formattedDate;
  }
}
