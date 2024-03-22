import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_api_bloc/models/MovieModel.dart';
import 'package:movie_app_api_bloc/repository/ApiRepository.dart';

import 'models/MovieDetailModel.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, LoadFav> {
  ApiRepository _apiRepository = ApiRepository();
  FavoriteBloc() : super(LoadFav([])) {
    on<FetchFav>((event, emit) async {
      print("Favorite list state");
      // // List<Results> ls = await _apiRepository.getallmovielist();
      //
      // print(state.item.length);
      // List<Results> item = [
      //   Results(id: 1,title: "hello")
      // ];
      print(state.item.length);
      // item = state.item;
      emit(LoadFav(state.item));


      // List<Results> ls;

    });
    on<AddFavoriteMovie>((event, emit) async {
    MovieDetailModel movie;
   //TODO all repository
   //    List<Results> ls = await _apiRepository.getallmovielist();

      movie = await _apiRepository.getmovieid(event.id);

      // print(ls.length);


      List< MovieDetailModel>? curritem = state.item;
      print(curritem?.length);

          curritem.add( MovieDetailModel(
              id: movie.id,
              title: movie.title,
              posterPath: movie.posterPath,
            popularity: movie.popularity,
            originalLanguage: movie.originalLanguage,

            adult: movie.adult,
            releaseDate: movie.releaseDate,
            genres: movie.genres



          ));

      // for (var element in ls) {
      //   if (element.id == event.id) {
      //     print(element.id);
      //     print("found");
      //
      //
      //
      //
      //     curritem.add(Results(
      //         id: element.id,
      //         title: element.title,
      //         posterPath: element.posterPath,
      //       popularity: element.popularity,
      //       originalLanguage: element.originalLanguage,
      //       adult: element.adult,
      //       releaseDate: element.releaseDate,genreIds: element.genreIds
      //
      //     ));
      //     return;
      //
      //
      //     // print(element.id);
      //   }
      //
      // }
      // emit( ProductState(curritem));


      emit(LoadFav(curritem));
// //     print("Movie List fav in bloc");
// //     print(ls.length);

    });
  }

  }
