import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/new_model.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({super.key, required this.newModel});

  final NewModel newModel;
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        CachedNetworkImage(
          imageUrl: newModel.urlToImage??"",
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Text(newModel.sourceModel.name??""),

        Text(newModel.title??"",

        maxLines: 1 ,   overflow:
          TextOverflow.ellipsis, ),
        Text(newModel.desc??"",
        maxLines: 2,
          overflow:
          TextOverflow.ellipsis,
        ),
        Row(
          children: [
            Text(newModel.sourceModel.name??""),
            Icon(Icons.date_range),
            Text(convertDate(newModel.publishedAt))
          ],
        )

      ],
    );
  }
  String  convertDate(dateString ) {


    DateTime dateTime = DateTime.parse(dateString);

    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
    // Output: 2024-09-12 – 07:05

    return formattedDate;
  }
}
