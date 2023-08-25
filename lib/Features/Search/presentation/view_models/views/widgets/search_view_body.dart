import 'package:booklyapp/Features/Search/presentation/manager/search_cubit/search_books_cubit.dart';
import 'package:booklyapp/Features/Search/presentation/view_models/views/widgets/custom_search_text_field.dart';
import 'package:booklyapp/Features/Search/presentation/view_models/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            controller: controller,
            onPressed: () {
              if (controller.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Please, Enter book name!'),
                ));
              } else {
                BlocProvider.of<SearchBooksCubit>(context).loadedBooks.clear();
                BlocProvider.of<SearchBooksCubit>(context).searchKey = controller.text;
                BlocProvider.of<SearchBooksCubit>(context)
                    .fetchSearchBook(searchKeyword: controller.text,startIndex: 0);
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
          const Text('Search Results'),
          const SizedBox(
            height: 15,
          ),
          const SearchListView(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
