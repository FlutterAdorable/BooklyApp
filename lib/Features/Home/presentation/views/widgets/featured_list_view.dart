import 'package:booklyapp/Core/utils/app_router.dart';
import 'package:booklyapp/Core/widgets/custom_error_message.dart';
import 'package:booklyapp/Core/widgets/custom_loading_indicator.dart';
import 'package:booklyapp/Core/widgets/shimmer_featured.dart';
import 'package:booklyapp/Features/Home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              padding: const EdgeInsetsDirectional.only(start: 20),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.items!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kBookDetails,
                        extra: state.books.items![index],
                      );
                    },
                    child: CustomBookImage(
                      imgUrl: state.books.items![index].volumeInfo?.imageLinks
                              ?.thumbnail
                              .toString() ??
                          'test',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height *0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, _i) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: ShimmerFeaturedList(),
              ),
              itemCount: 3,
            ),
          );
        }
      },
    );
  }
}
