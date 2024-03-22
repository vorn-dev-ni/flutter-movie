import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_api_bloc/models/GenreModel.dart';
import 'package:movie_app_api_bloc/models/Genrev2model.dart';
import 'package:movie_app_api_bloc/models/MovieSearchModel.dart';
import 'package:movie_app_api_bloc/repository/ApiRepository.dart';
import '../../models/MovieDetailModel.dart';
import '../../models/MovieFavModel.dart';
import '../../models/MovieModel.dart';
import '../../models/RecentModel.dart';
import '../../models/TrendingModel.dart';


part 'moviebloc_event.dart';
part 'moviebloc_state.dart';

class MovieblocBloc extends Bloc<MovieblocEvent, MovieblocState> {
  MovieFavoriteList fav = MovieFavoriteList();
  ApiRepository _apiRepository = ApiRepository();

  List<FavoriteModel> favoritelist = [];

  MovieblocBloc() : super(MovieInitstate()) {
    on<FetchMovieEvent>((event, emit) => MovieEmit(event,emit));
    // on<FetchMoviePopular>((event, emit) async {
    //   try{
    //     emit(MovieLoadingState());
    //     var  ls = await _apiRepository.getmoviepopularrepo();
    //     emit(MovieStatePopular(ls));
    //
    //
    //
    //   }catch (error){
    //     print("Error here popular?");
    //     print(error);
    //     emit(MovieErrorState());
    //   }
    // });
    on<FetchRecentMovie>((event, emit) async{
      try{
        emit(MovieLoadingState());
        var  ls = await _apiRepository.getmovienowplaying();
        // print(ls);
        emit(MovieStateRecent(ls));



      }catch (error){
        // print("Error here");
        // print(error);
        emit(MovieErrorState());
      }
    });
    on<FetchTopMovie>((event, emit) async{
      try{
        emit(MovieLoadingState());
        var  ls = await _apiRepository.getmovietopplaying();
        // print(ls);
        emit(MovieTopRatedState(ls));



      }catch (error){
        // print("Error here");
        // print(error);
        emit(MovieErrorState());
      }
    });
    on<FetchUpcoming>((event, emit) async{
      try{
        emit(MovieLoadingState());
        var  ls = await _apiRepository.getmovieupcoming();
        // print(ls);
        emit(MovieUpcoming(ls));



      }catch (error){
        // print("Error here");
        // print(error);
        emit(MovieErrorState());
      }
    });
    on<FetchMovieDetail>((event, emit) async{
      try{
        emit(MovieLoadingState());
        print(event.id);
        var movie = await _apiRepository.getmovieid(event.id);
        // print(ls);

        emit(MovieDetail(item: movie));



      }catch (error){
        // print("Error here");
        print(error);
        emit(MovieErrorState());
      }
    });
    on<SearchMovie>((event, emit) async{
      try{
        emit(MovieLoadingState());
        print(event.title);
        var movie = await _apiRepository.getmoviequery(event.title);
        print(movie );


        emit(MovieTitleQuery(movie));





      }catch (error){
        print("Error here");
        print(error);
        emit(MovieErrorState());
      }
    });
    on<FetchGenre>((event, emit) async{
      try{
        emit(MovieLoadingState());

        var movie = await _apiRepository.getmoviegenre();
        print(movie );

        emit(MovieGenre(movie));





      }catch (error){
        print("Error here");
        print(error);
        emit(MovieErrorState());
      }
    });
    on<FetchGenreById>((event, emit) async{
      try{
        emit(MovieLoadingState());

        var movie = await _apiRepository.getmoviebygenre(event.id);
        print(movie );

        emit(MoviebyGenre(movie));





      }catch (error){
        print("Error here");
        print(error);
        emit(MovieErrorState());
      }
    });
    on<FetchAllMovieList>((event, emit) async{
      try{
        emit(MovieLoadingState());
        List<Results> ls;

        ls  = await _apiRepository.getallmovielist();
        print(ls);

        // emit(MoviebyGenre(movie));





      }catch (error){
        print("Error here");
        print(error);
        emit(MovieErrorState());
      }
    });



  }
  MovieEmit(FetchMovieEvent event, Emitter<MovieblocState> emit)
  async {
    try{
      emit(MovieLoadingState());
      var  ls = await _apiRepository.getmovierepository();
      emit(MovieFetchState(ls));



    }catch (error){
      print("Error here");
      print(error);
      emit(MovieErrorState());
    }
  }
}



