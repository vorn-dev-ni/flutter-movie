part of 'moviebloc_bloc.dart';


abstract class MovieblocEvent {

  const MovieblocEvent();
}

class FetchAllMovieList extends MovieblocEvent {

}

class FetchMovieEvent extends MovieblocEvent {

}
class FetchMoviePopular extends MovieblocEvent{

}

class FetchRecentMovie extends MovieblocEvent {

}
class FetchTopMovie extends MovieblocEvent {

}
class FetchUpcoming extends MovieblocEvent {

}
class SearchMovie extends MovieblocEvent {
String? title;

SearchMovie(this.title);
}
class FetchMovieDetail extends MovieblocEvent {
var id;

FetchMovieDetail(this.id);
}

class FetchGenre extends MovieblocEvent{

}
class FetchGenreById  extends MovieblocEvent {
 var id;

  FetchGenreById(this.id);
}
