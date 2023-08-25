import 'package:booklyapp/Core/errors/failures.dart';
import 'package:booklyapp/Core/models/BookModel.dart';
import 'package:booklyapp/Core/utils/api_service.dart';
import 'package:booklyapp/Features/Search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, BookModel>> fetchSearchBook({
    required String searchKeyword,
    required int startIndex,
  }) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=$searchKeyword&startIndex=$startIndex');
      BookModel books = BookModel.fromJson(data);
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }
}
