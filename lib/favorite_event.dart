part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}


class FetchFav extends FavoriteEvent {

}

class AddFavoriteMovie extends FavoriteEvent {
  var id;

  AddFavoriteMovie(this.id);
}