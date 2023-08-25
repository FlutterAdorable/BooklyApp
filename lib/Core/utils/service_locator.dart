import 'package:booklyapp/Core/utils/api_service.dart';
import 'package:booklyapp/Features/Home/data/repo/home_repo_impl.dart';
import 'package:booklyapp/Features/Search/data/repo/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()),);
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
        getIt.get<ApiService>(),
    ),);
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      getIt.get<ApiService>(),
    ),);
}
