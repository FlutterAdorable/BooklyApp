import 'package:booklyapp/Core/models/BookModel.dart';
import 'package:booklyapp/Core/widgets/custom_error_message.dart';
import 'package:booklyapp/Core/widgets/shimmer_best_Seller.dart';
import 'package:booklyapp/Features/Home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/best_seller_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        var bookItems = BlocProvider.of<NewestBooksCubit>(context).loadedBooks;

        if (state is NewestBooksSuccess) {
          bookItems = state.books.items!;
        } else if (state is NewestBooksFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: bookItems.length + 1,
          itemBuilder: (context, index) {
            if(index < bookItems.length) {
              return Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: BookListViewItem(bookModel: bookItems[index]),
            );
            } else
            {
              return const ShimmerBestSeller();
            }
          },
        );
      },
    );
  }
}
