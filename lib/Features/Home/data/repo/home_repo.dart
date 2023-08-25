import 'package:booklyapp/Core/errors/failures.dart';
import 'package:booklyapp/Core/models/BookModel.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo
{
  Future<Either<Failure,BookModel>> fetchNewestBooks({required int startIndex});
  Future<Either<Failure,BookModel>> fetchFeaturedBook();
  Future<Either<Failure,BookModel>> fetchSimilarBook({required String category});
}