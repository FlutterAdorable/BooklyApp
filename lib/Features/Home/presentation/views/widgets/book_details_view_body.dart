import 'package:booklyapp/Core/models/BookModel.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/books_details_section.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/related_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final Items bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children:
            [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomBookDetailsAppBar(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: BooksDetailsSection(bookModel: bookModel,),
              ),
              const Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
              const RelatedBooksSection(),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
