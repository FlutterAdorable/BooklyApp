import 'package:booklyapp/Core/utils/styles.dart';
import 'package:booklyapp/Core/models/BookModel.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/books_actions.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.bookModel});

  final Items bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2,),
          child: CustomBookImage(imgUrl: bookModel?.volumeInfo?.imageLinks?.thumbnail ?? ''),
        ),
        const SizedBox(height: 43,),
        Text(bookModel.volumeInfo!.title != null ? bookModel.volumeInfo!.title! : 'No Title',style: Styles.textStyle30,textAlign: TextAlign.center,),
        const SizedBox(height: 6,),
        Opacity(opacity: 0.7,child: Text(bookModel.volumeInfo!.authors?.isNotEmpty == true
            ? bookModel.volumeInfo!.authors![0]
            : 'Unknown'
          ,style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic,),)),
        const SizedBox(height: 18,),
        BookRating(mainAxisAlignment: MainAxisAlignment.center,bookModel: bookModel),
        const SizedBox(height: 37,),
        BooksActions(bookModel: bookModel,),
      ],
    );
  }
}
