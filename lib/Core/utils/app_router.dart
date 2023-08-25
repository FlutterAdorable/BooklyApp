import 'package:booklyapp/Core/models/BookModel.dart';
import 'package:booklyapp/Core/utils/service_locator.dart';
import 'package:booklyapp/Features/Home/data/repo/home_repo_impl.dart';
import 'package:booklyapp/Features/Home/presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:booklyapp/Features/Home/presentation/views/book_details_view.dart';
import 'package:booklyapp/Features/Home/presentation/views/home_view.dart';
import 'package:booklyapp/Features/Search/data/repo/search_repo_impl.dart';
import 'package:booklyapp/Features/Search/presentation/manager/search_cubit/search_books_cubit.dart';
import 'package:booklyapp/Features/Search/presentation/view_models/views/search_view.dart';
import 'package:booklyapp/Features/Splash/presesntation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetails = '/bookDetails';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Splash(),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(
              seconds: 1,
            ),
            child: const HomeView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(
                  Tween(
                    begin: const Offset(0, 1.5),
                    end: Offset.zero,
                  ).chain(
                    CurveTween(curve: Curves.ease),
                  ),
                ),
                child: FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                ),
              );
            },
          );
        },
      ),
      GoRoute(
        path: kBookDetails,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(
              milliseconds: 450,
            ),
            child: BlocProvider(
              create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
              child: BookDetailsView(
                bookModel: state.extra as Items,
              ),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(
                  Tween(
                    begin: const Offset(1.5, 0),
                    end: Offset.zero,
                  ).chain(
                    CurveTween(curve: Curves.ease),
                  ),
                ),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kSearchView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(
              milliseconds: 150,
            ),
            child: BlocProvider(
              create: (BuildContext context) => SearchBooksCubit(getIt.get<SearchRepoImpl>()),
              child: const SearchView(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
