import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:podsriver/dummy/book_data.dart';
import 'package:podsriver/views/detail_page.dart';



class Sample extends StatelessWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      height: 210.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: bookDataFromJson.length,
          itemBuilder: (context, index){
            final book = bookDataFromJson[index];
            return InkWell(
              onTap: (){
               Get.to(() => DetailPage(book: book,), transition: Transition.leftToRight);
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                      child: Container(
                        height: 190.h,
                        padding: EdgeInsets.all(5),
                        width: 370.w,
                        child: Row(
                          children: [
                            Spacer(
                              flex: 3,
                            ),
                            Expanded(
                              flex: 7,
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 14.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(book.title),
                                    Text(
                                      book.detail,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 5,
                                      // textAlign: TextAlign.left,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(book.rating),
                                        Text(book.genre, style: TextStyle(color: Colors.blueGrey),)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 15.h,
                    left: 10.w,
                    child: Image.network(
                      book.image,
                      width: 115.w,
                      height: 220.h,
                      fit: BoxFit.fill,
                    ),
                  ),

                ],
              ),
            );
          }
      ),
    );
  }
}
