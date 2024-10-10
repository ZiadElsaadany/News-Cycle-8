import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_api_cycle_8/core/app_colors.dart';
import 'package:news_api_cycle_8/core/app_images.dart';
import 'package:news_api_cycle_8/features/home/presentation/controller/book_mark_cubit/book_mark_cubit.dart';
import 'package:news_api_cycle_8/features/home/presentation/view/widgets/home/home_screen.dart';

import 'book_marks_screen.dart';


class HomeBottom extends StatefulWidget {
   HomeBottom({super.key});

  @override
  State<HomeBottom> createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  final List<Widget> lst = [
    const HomeScreen(),
  BookMarksScreen()
  ] ;

  int currentIndex= 0 ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<BookMarkCubit>(context).fetchBookMarks();
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CircleAvatar(),
        title: Image.asset(AppImages.newsLogo,
        width: 144,
        height: 63,
        ),
        toolbarHeight: 120,

      ),
      body: lst[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
onTap: (index) {
  currentIndex=index;
  setState(() {});
},
          currentIndex: currentIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),

        BottomNavigationBarItem(icon: Icon(Icons.bookmark,

        ),label: "BookMarks"),


      ] ),

    );
  }
}
