
import 'package:booklyapp/Core/models/BookModel.dart';
import 'package:booklyapp/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key,this.mainAxisAlignment = MainAxisAlignment.start, required this.bookModel});
  final MainAxisAlignment mainAxisAlignment;
  final Items bookModel;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(FontAwesomeIcons.solidStar,color: Color(0xffffdd4f),size: 13,),
        const SizedBox(width: 6.3,),
        Text(bookModel.volumeInfo!.averageRating != null ? bookModel.volumeInfo!.averageRating.toString() : '0',style: Styles.textStyle16),
        const SizedBox(width: 5,),
        Opacity(opacity: 0.5, child: Text(bookModel.volumeInfo!.ratingsCount != null ? '(${bookModel.volumeInfo!.ratingsCount.toString()})' : '(0)',style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),)),
      ],
    );
  }
}