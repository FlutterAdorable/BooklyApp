import 'package:booklyapp/Core/utils/app_router.dart';
import 'package:booklyapp/Core/utils/styles.dart';
import 'package:booklyapp/Core/models/BookModel.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:booklyapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key, required this.bookModel,
  });
  final Items bookModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetails,extra: bookModel,);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(imgUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? 'Test'),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bookModel.volumeInfo!.title?.isNotEmpty == true ? bookModel.volumeInfo!.title! : 'No Title',
                    style: Styles.textStyle20.copyWith(fontFamily: KGTSectra),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(bookModel.volumeInfo!.authors?.isNotEmpty == true
                      ? bookModel.volumeInfo!.authors![0]
                      : 'Unknown', style: Styles.textStyle14,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(bookModel.saleInfo?.listPrice?.amount != null ?'${bookModel.saleInfo!.listPrice!.amount!.round()} ${bookModel.saleInfo!.listPrice!.currencyCode}' : 'Free',style: Styles.textStyle20,),
                      BookRating(bookModel: bookModel,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



