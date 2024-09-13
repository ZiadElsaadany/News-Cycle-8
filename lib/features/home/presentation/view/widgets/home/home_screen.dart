import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/get_top_headline/get_top_headline_cubit.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/get_top_headline/get_top_headline_states.dart';
import 'package:news_api_cycle_8/features/home/presentation/view/widgets/home/search_widget.dart';

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
      category: "technology"
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(

       onRefresh: ()async{
         BlocProvider.of<TopHeadlineCubit>(context).getTopHeadline(
             category: "technology"

         );
       },

        child: Column(
        children: [
          SearchWidget(),
          BlocConsumer<TopHeadlineCubit, TopHeadlineStates>(
            listener: (context, state) {

              if(state is GetTopHeadlineFailureState ) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }

            },
            builder: (context, state) {
              return Expanded(child: state is GetTopHeadlineLoadingState?

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
                          category: "technology"

                      );

                    } , child: Text("Try Again"))
                  ],
                ),
              ): ListViewForNews(news: BlocProvider
                  .of<TopHeadlineCubit>(context)
                  .topHeadlines,));
            },
          )
        ],
      ),
    );
  }
}
