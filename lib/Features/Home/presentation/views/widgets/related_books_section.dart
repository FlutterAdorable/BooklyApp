import 'package:booklyapp/Core/utils/styles.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/realted_books_list_view.dart';
import 'package:flutter/material.dart';

class RelatedBooksSection extends StatelessWidget {
  const RelatedBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text('You can also like',style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),),
        ),
        const SizedBox(
          height: 10,
        ),
        const RelatedBooksListView(),
      ],
    );
  }
}
