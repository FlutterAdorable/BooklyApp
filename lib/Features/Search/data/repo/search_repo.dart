import 'package:booklyapp/Core/errors/failures.dart';
import 'package:booklyapp/Core/models/BookModel.dart';
import 'package:dartz/dartz.dart';


abstract class SearchRepo
{
  Future<Either<Failure,BookModel>> fetchSearchBook({required String searchKeyword,required int startIndex});
}
