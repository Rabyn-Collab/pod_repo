import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podsriver/constants/app_sizes.dart';
import 'package:podsriver/dummy/book_data.dart';
import 'package:podsriver/views/widgets/sample.dart';




class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
       title: Text('Hi John,', style: GoogleFonts.roboto(),),
        actions: [
          Icon(CupertinoIcons.search),
          AppSizes.gapW16,
          Icon(
            CupertinoIcons.bell_fill, color: Colors.red,size: 30,),
          AppSizes.gapW16
        ],
      ),
      body: ListView(
        children: [

          Image.asset('assets/images/merm.jpg',
            height: 300.h,
            width: double.infinity, fit: BoxFit.cover,),
          AppSizes.gapH14,
               Sample(),
       Padding(
         padding:  EdgeInsets.symmetric(horizontal: 10.w),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text('You may also like',
               style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),),
            Container(
              margin: EdgeInsets.only(top: 10.h),
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bookDataFromJson.length,
                  itemBuilder: (context, index){
                  return Container(
                    width: 100.w,
                    margin: EdgeInsets.only(right: 10.w),
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10.w),
                            child: Image.network(bookDataFromJson[index].image)),
                        AppSizes.gapH6,
                        Text(bookDataFromJson[index].genre, style: TextStyle(color: Colors.blueGrey),),
                      ],
                    ),
                  );
                  }
              ),
            ),

           ],
         ),
       )

        ],
      )

    );
  }
}
