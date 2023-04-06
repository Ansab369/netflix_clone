import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/domain/search/model/search_repo/search_repo.dart';
import 'package:netflix_clone/domain/search/model/search_services.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
/* 
    ideal state
*/
    on<Initialized>((event, emit) async {
      if (state.idealList.isNotEmpty) {
        emit(
          SearchState(
            searchResultList: [],
            idealList: state.idealList,
            isLoading: false,
            isError: false,
          ),
        );
        return;
      }
      emit(
        const SearchState(
            searchResultList: [],
            idealList: [],
            isLoading: true,
            isError: false),
      );
      // get trending
      final _result = await _downloadsService.getDownloadsImages();
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
              searchResultList: [],
              idealList: [],
              isLoading: false,
              isError: true);
        },
        (List<Downloads> list) {
          return SearchState(
              searchResultList: [],
              idealList: list,
              isLoading: false,
              isError: false);
        },
      );
      // show in UI
      emit(_state);
    });

/*
 searcch result state 
*/
    on<SearchMovie>((event, emit) {
      // call search api
      _searchService.searchMovies(movieQuery: event.movieQuery);
      // display in UI
    });
  }
}
