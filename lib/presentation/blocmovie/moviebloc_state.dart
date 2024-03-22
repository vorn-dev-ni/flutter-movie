part of 'moviebloc_bloc.dart';


abstract class MovieblocState extends Equatable {


}

class MovieInitstate extends MovieblocState  {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}
class MovieLoadingState extends  MovieblocState {
  @override
  // TODO: implement props
  List<Object?> get props => [];


}

class MovieFetchState extends MovieblocState {
  List<Results> item;
  MovieFetchState(this.item);

  @override
  // TODO: implement props
  List<Object?> get props => [item];

}

class MovieStatePopular extends MovieblocState {
  List<MovieTrend>? item;


  MovieStatePopular(this.item);

  @override
  // TODO: implement props
  List<Object?> get props => [item];

}

class MovieFavoriteList extends MovieblocState {

  List<Results>? item;


  MovieFavoriteList({this.item});




  @override
  // TODO: implement props
  List<Object?> get props => [item];

}
class MovieStateRecent extends MovieblocState {
  List<MovieResult > item;


  MovieStateRecent(this.item);

  @override
  // TODO: implement props
  List<Object?> get props => [item];

}
class MovieDetailGenre extends MovieblocState {

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class MovieGenre extends MovieblocState {
 List<Genreresult>? item;

  MovieGenre(this.item);

  @override
  // TODO: implement props
  List<Object?> get props => [item];

}
class MovieTitleQuery extends MovieblocState {
  List<ResultSearch > item;


  MovieTitleQuery (this.item);

  @override
  // TODO: implement props
  List<Object?> get props => [item];

}
class MovieAllState extends MovieblocState {
  List<Results>? item;


  MovieAllState(this.item);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class MoviebyGenre extends MovieblocState {
  List<ResultGenre>? item;

  MoviebyGenre(this.item);

  @override
  // TODO: implement props
  List<Object?> get props => [item];

}
class MovieDone extends MovieblocState {
  List<Results> item;
  MovieDone(this.item);
  @override
  // TODO: implement props
  List<Object?> get props => [item];

}

class MovieErrorState extends MovieblocState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class MovieTopRatedState extends MovieblocState {
  List<MovieResult> item;


  MovieTopRatedState(this.item);

  @override
  // TODO: implement props
  List<Object?> get props => [item];

}

class MovieUpcoming extends MovieblocState {
  List<MovieResult> item;


  MovieUpcoming (this.item);

  @override
  // TODO: implement props
  List<Object?> get props => [item];

}class MovieDetail extends MovieblocState {
 MovieDetailModel? item;


  MovieDetail ({this.item});

  @override
  // TODO: implement props
  List<Object?> get props => [item];

}