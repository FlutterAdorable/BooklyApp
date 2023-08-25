import 'package:booklyapp/Core/errors/failures.dart';
import 'package:booklyapp/Core/utils/api_service.dart';
import 'package:booklyapp/Core/models/BookModel.dart';
import 'package:booklyapp/Features/Home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService,);


  @override
  Future<Either<Failure, BookModel>> fetchNewestBooks({required int startIndex}) async {
    try {
      var data = await apiService.get(
          endPoint:
              
              'volumes?Filtering=free-ebooks&Sorting=newest&q=programming&startIndex=$startIndex');
      BookModel books = BookModel.fromJson(data);
      return right(books);


    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchFeaturedBook() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=computer science');
      BookModel books = BookModel.fromJson(data);
      return right(books);
    } on DioException catch (e) {
        return left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchSimilarBook({required String category}) async{
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance&q=Subject:$category');
      BookModel books = BookModel.fromJson(data);
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchSearchBook({required String searchKeyword}) async{
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance&q=Subject:$searchKeyword');
      BookModel books = BookModel.fromJson(data);
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
