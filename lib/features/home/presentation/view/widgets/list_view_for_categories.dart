import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_cycle_8/features/home/data/models/category_model.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/categories/categories_cubit.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/categories/categories_states.dart';

import '../../../../../core/app_colors.dart';
import '../../controller/book_mark_cubit/book_mark_cubit.dart';
import '../../controller/get_top_headline/get_top_headline_cubit.dart';

class ListViewForCategories extends StatelessWidget {
   ListViewForCategories({super.key});
   // business entertainment general health science sports technology
  final List<CategoryModel> categories = [
    CategoryModel(name: "sports"),
    CategoryModel(name: "technology"),
    CategoryModel(name: "business"),
    CategoryModel(name: "entertainment"),
    CategoryModel(name: "general"),
    CategoryModel(name: "science"),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.builder(
        itemCount: categories.length,

          scrollDirection: Axis.horizontal,
          itemBuilder: (c,index) {
        return  CategoryWidget(
          index: index,
          categoryModel: categories[index],
        ) ;
      } ),
    );
  }
}
class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.categoryModel, required this.index});

  final CategoryModel categoryModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesStates>(
  builder: (context, state) {
    return GestureDetector(
      onTap: ( ) {
        BlocProvider.of<CategoriesCubit>(context).changeIndex(index);
        BlocProvider.of<TopHeadlineCubit>(context).getTopHeadline(
            bookmarksList: BlocProvider.of<BookMarkCubit>(context).bookMarks,


          category: categoryModel.name,
          index: index
        );

      } ,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:
          BlocProvider.of<CategoriesCubit>(context).categoryIndex==index ?



          AppColors.primaryColor:AppColors.white
        ),
        child: Text(categoryModel.name,
        style: TextStyle(
          color:  BlocProvider.of<CategoriesCubit>(context).categoryIndex== index?
              AppColors.white
              :AppColors.black
        ),
        ),
      ),
    );
  },
);
  }
}
