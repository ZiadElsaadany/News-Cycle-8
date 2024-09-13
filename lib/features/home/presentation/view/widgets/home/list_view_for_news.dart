import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_api_cycle_8/features/home/data/models/new_model.dart';

import 'new_widget.dart';

class ListViewForNews extends StatelessWidget {
  const ListViewForNews({super.key, required this.news});
final List<NewModel> news;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index) {

      return  NewWidget(newModel: news[index]);
    } ,
    itemCount: news.length,
    );
  }
}

