part of 'search_books_cubit.dart';

abstract class SearchBooksState {}

class SearchBooksInitial extends SearchBooksState {}

class SearchBooksLoading extends SearchBooksState {}
class SearchBooksSuccess extends SearchBooksState {
  final BookModel bookModel;

  SearchBooksSuccess(this.bookModel);
}
class SearchBooksFailure extends SearchBooksState {
  final String errMessage;

  SearchBooksFailure(this.errMessage);
}
