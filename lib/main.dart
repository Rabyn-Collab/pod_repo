import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:podsriver/constants/colors.dart';



void main (){

 runApp(Home());
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      minTextAdapt: true,

     designSize: Size(width, height),
      builder: (c,d) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Raleway',
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.backGroundColor
            // backgroundColor: Colors.pink.shade400,
            // foregroundColor: Colors.black
          ),
          colorSchemeSeed: AppColors.mainColor,
          scaffoldBackgroundColor: AppColors.backGroundColor,
          // textTheme: TextTheme(
          //   titleMedium: TextStyle()
          // )
        ),
        // theme: ThemeData.dark().copyWith(
        //     useMaterial3: true,
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink)
        // ),


      ),
    );
  }
}
