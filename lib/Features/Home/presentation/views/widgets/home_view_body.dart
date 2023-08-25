import 'package:booklyapp/Core/utils/styles.dart';
import 'package:booklyapp/Features/Home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/Home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/custom_appbar.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ScrollController scrollController = ScrollController();
  int startIndex = 0;


  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      // User reached the end of the list, fetch more data
      startIndex += 10; // Increment the index
      BlocProvider.of<NewestBooksCubit>(context)
          .fetchNewestBooks(startIndex: startIndex);
    }
  }

  @override
  void dispose() {
    print("#");
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return refreshAllData(context);
      },
      child: CustomScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: const [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeaturedListView(),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: Text(
                    'Best Seller',
                    style: Styles.textStyle18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: BestSellerListView(),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> refreshAllData(context) async
{
  BlocProvider.of<NewestBooksCubit>(context).loadedBooks.clear();
  BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(startIndex: 0);
  BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
}