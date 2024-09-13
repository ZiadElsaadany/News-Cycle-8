import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_api_cycle_8/core/app_images.dart';
import 'package:news_api_cycle_8/features/home/presentation/view/widgets/home/home_screen.dart';

class HomeBottom extends StatelessWidget {
   HomeBottom({super.key});

  final List<Widget> lst = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ] ;
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
      body: lst[0],
      bottomNavigationBar: BottomNavigationBar(items: [ 
        BottomNavigationBarItem(icon: SvgPicture.asset(
          AppImages.homeActiveIcon
        ),label: "Home"),
        BottomNavigationBarItem(icon: SvgPicture.asset(

            AppImages.homeActiveIcon
        ),label: "Home"),
        BottomNavigationBarItem(icon: SvgPicture.asset(
            AppImages.homeActiveIcon
        ),label: "Home"),
        
      ] ),

    );
  }
}
