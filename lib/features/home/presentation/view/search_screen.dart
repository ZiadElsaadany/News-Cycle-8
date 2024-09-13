import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_cycle_8/features/home/data/repos/home_repo_implemetation.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/search_cubit/search_cubit.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/search_cubit/search_states.dart';
import 'package:news_api_cycle_8/features/home/presentation/view/widgets/home/list_view_for_news.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchCubit(homeRepo: HomeRepoImplementationFromApi()),
      child: Scaffold(
          appBar: AppBar(),
          body: SearchBody()
      ),
    );
  }
}


class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            TextFormField(
onChanged: (q) {
  BlocProvider.of<SearchCubit>(context).getSearch(q: q.trim());
},
            ),
            Expanded(
                child: state is GetSearchLoadingState ?

            const Center(
              child: CircularProgressIndicator(),
            )
            : ListViewForNews(news:   BlocProvider.of<SearchCubit>(context).searchNews))
          ],
        );
      },
    );
  }
}
