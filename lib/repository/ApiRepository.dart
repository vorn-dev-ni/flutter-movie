
import 'package:movie_app_api_bloc/models/CastModel.dart';
import 'package:movie_app_api_bloc/models/GenreModel.dart';
import 'package:movie_app_api_bloc/models/Genrev2model.dart';
import 'package:movie_app_api_bloc/models/MovieDetailModel.dart';
import 'package:movie_app_api_bloc/models/MovieModel.dart';
import 'package:movie_app_api_bloc/models/MovieSearchModel.dart';
import 'package:movie_app_api_bloc/models/PopularModel.dart';
import 'package:movie_app_api_bloc/models/RecentModel.dart';
import 'package:movie_app_api_bloc/models/TrendingModel.dart';

import '../data/network/NetworkApiService.dart';
import '../models/Product.dart';

class ApiRepository {


  final provider =  NetworkApiService();
  Future  <dynamic> getalluser () async{

    try{
  List response  = await provider.fetchUserList();
  List ls =  response.map((e) => Post.fromJson(e)).toList();
        return ls;


      }catch(err){
       rethrow;
      }

  }

  Future <dynamic> getmovierepository () async {

    try{
      var res = await provider.movieNetworkService();


// print(res);
//           print(MovieModel.fromJson(res).results);
      return MovieModel.fromJson(res).results;

      // return  res.map((e) => MovieModel.fromJson(e)).toList();


    }catch(e){
      rethrow;
    }

  }
  Future <dynamic> getallmovielist () async {

    try{
      var res = await provider.movieall();
      print("ALl Movie APi repo");

      // print(MovieModel.fromJson(res).results);
      return MovieModel.fromJson(res).results;

      // return  res.map((e) => MovieModel.fromJson(e)).toList();


    }catch(e){
      rethrow;
    }

  }

  Future <dynamic> getmoviepopularrepo () async {

    try{
      var res = await provider. movieNetworkPopularService();

          // print(MovieModel.fromJson(res).results);
      return MovieTrendingModel.fromJson(res).results;

      // return  res.map((e) => MovieModel.fromJson(e)).toList();


    }catch(e){
      rethrow;
    }

  }

  Future <dynamic> getmovienowplaying () async {

    try{
      var res = await provider. movieNetworkNowPlayingService();
      // print(res);
      print("hello");
      // print(MovieModel.fromJson(res).results);
      return MovieRecentModel.fromJson(res).results;

      // return  res.map((e) => MovieModel.fromJson(e)).toList();


    }catch(e){
      rethrow;
    }

  }
  Future <dynamic> getmovieupcoming () async {

    try{
      var res = await provider. movieNetworkUpComingService();
      // print(res);
      // print("hello");
      // print(MovieModel.fromJson(res).results);
      return MovieRecentModel.fromJson(res).results;

      // return  res.map((e) => MovieModel.fromJson(e)).toList();


    }catch(e){
      rethrow;
    }

  }

  Future <dynamic> getmovieid(id) async {

    try{
      var res = await provider. movieNetworkDetailId(id);
      // print(res);
      print("hello in api repository  $id");
      // print(MovieModel.fromJson(res).results);
      return MovieDetailModel.fromJson(res);

      // return  res.map((e) => MovieModel.fromJson(e)).toList();


    }catch(e){
      rethrow;
    }

  }
  Future <dynamic> getmovietopplaying () async {

    try{
      var res = await provider. movieNetworkTopRatedService();
      // print(res);
      print("hello");
      // print(MovieModel.fromJson(res).results);
      return MovieRecentModel.fromJson(res).results;

      // return  res.map((e) => MovieModel.fromJson(e)).toList();


    }catch(e){
      rethrow;
    }

  }
  // https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200&primary_release_date.gte=2023-06-01
  Future<dynamic> getmoviedetail(var id) async {
    try{
      var response = await provider.movieDetailcastService(id);
      // print(response);
   return   CastModel.fromJson(response).cast;

    }catch(err){
      rethrow;
    }
  }
  Future<dynamic> getmoviequery(var title) async {
    try{
      var response = await provider.movieDetailSearchService(title.toString());
      print(response);
      return MovieSearchModel.fromJson(response).results;

    }catch(err){
      rethrow;
    }
  }
  Future<dynamic> getmoviegenre() async {
    try{
      var response = await provider.moviegenreService();
      print(response);
      return GenreModel.fromJson(response).genres;

    }catch(err){
      rethrow;
    }
  }
  Future<dynamic> getmoviebygenre(id) async {
    try{
      var response = await provider.moviebygidService(id);
      print(response);
      return MovieGenrev2Model.fromJson(response).results;

    }catch(err){
      rethrow;
    }
  }
}