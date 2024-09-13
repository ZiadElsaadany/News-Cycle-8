import 'package:flutter/material.dart';
import 'package:news_api_cycle_8/features/home/presentation/view/search_screen.dart';

import '../../../../../../core/app_colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ( ) {
        Navigator.push(context, MaterialPageRoute(builder: (e) {
          return SearchScreen();
        }));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
      height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor)
        ),
      ),
    );
  }
}
