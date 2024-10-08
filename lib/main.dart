import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_api_cycle_8/core/app_fonts.dart';
import 'package:news_api_cycle_8/core/hive.dart';
import 'package:news_api_cycle_8/features/home/data/models/new_model.dart';
import 'package:news_api_cycle_8/features/home/data/models/source_model.dart';
import 'package:news_api_cycle_8/features/home/data/repos/home_repo_implemetation.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/book_mark_cubit/book_mark_cubit.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/get_top_headline/get_top_headline_cubit.dart';
import 'package:news_api_cycle_8/features/splash/presentation/view/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Hive.initFlutter();
  Hive.registerAdapter(NewModelAdapter());
  Hive.registerAdapter(SourceModelAdapter());
await  Hive.openBox<NewModel>(AppHive.bookMarkBox);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );




  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (c)=>TopHeadlineCubit(homeRepo: HomeRepoImplementationFromApi()),
        ),
        BlocProvider(
          create: (c)=>BookMarkCubit()
        ),

      ],
      child: const NewsApp()));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: AppFonts.poppinsFont
      ),
      home: const SplashScreen()
    );
  }
}
