part of 'favorite_bloc.dart';



class FavoriteInitial  {

}

class UpdateFav {

}
class LoadFav extends Equatable{

  List< MovieDetailModel> item;

  LoadFav(this.item);

  @override
  // TODO: implement props
  List<Object?> get props => [item];
}