import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/book_mark_cubit/book_mark_cubit.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/categories/categories_cubit.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/get_top_headline/get_top_headline_cubit.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/get_top_headline/get_top_headline_states.dart';
import 'package:news_api_cycle_8/features/home/presentation/view/widgets/home/search_widget.dart';

import '../../../../data/models/new_model.dart';
import '../list_view_for_categories.dart';
import 'list_view_for_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TopHeadlineCubit>(context).getTopHeadline(
      bookmarksList: BlocProvider.of<BookMarkCubit>(context).bookMarks,
       index:0 ,
      category: "sports"
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(  create: (c)=>CategoriesCubit(),),
      ],
      child: RefreshIndicator(

         onRefresh: ()async{
           BlocProvider.of<TopHeadlineCubit>(context).getTopHeadline(
               bookmarksList: BlocProvider.of<BookMarkCubit>(context).bookMarks,

               category: "sports",
             index: 0

           );
         },

          child: Column(
          children: [
            SearchWidget(),
            ListViewForCategories(),
            BlocConsumer<TopHeadlineCubit, TopHeadlineStates>(
              listener: (context, state) {

                if(state is GetTopHeadlineFailureState ) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                }

              },
              builder: (context, state) {


                // 0
                // key  = 0
                //  values = sports[]


                int key =BlocProvider.of<CategoriesCubit>(context).categoryIndex;
                List<NewModel>?  news = BlocProvider.of<TopHeadlineCubit>(context).mapForNews[key] ;


                 ///  { 0: [NewModel] }

                return Expanded(child:

                state is GetTopHeadlineLoadingState &&  news== null
                    ||    state is GetTopHeadlineLoadingState && news!.isEmpty


                    ?

                        const Center(
                          child: CircularProgressIndicator(),
                        )
                        : state is GetTopHeadlineFailureState ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error),
                      Text(state.errorMessage),
                      TextButton(onPressed: ( ){
                        BlocProvider.of<TopHeadlineCubit>(context).getTopHeadline(
                            bookmarksList: BlocProvider.of<BookMarkCubit>(context).bookMarks,


                            category: "sports",
                          index: 0

                        );

                      } , child: Text("Try Again"))
                    ],
                  ),
                ): ListViewForNews(news:news!));
              },
            )
          ],
        ),
      ),
    );
  }
}
