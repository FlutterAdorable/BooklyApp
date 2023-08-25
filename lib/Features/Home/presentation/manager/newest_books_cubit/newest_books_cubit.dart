import 'package:bloc/bloc.dart';
import 'package:booklyapp/Core/models/BookModel.dart';
import 'package:booklyapp/Features/Home/data/repo/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;
  List<Items> loadedBooks = [];

  Future<void> fetchNewestBooks({required int startIndex}) async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks(startIndex: startIndex);


    result.fold(
      (failure) => emit(NewestBooksFailure(failure.errMessage)),
      (books) {
        loadedBooks.addAll(books.items as Iterable<Items>);
        emit(NewestBooksSuccess(BookModel(items: loadedBooks)));
      },
    );
  }
}
