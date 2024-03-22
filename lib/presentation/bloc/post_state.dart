part of 'post_bloc.dart';

abstract class PostState extends Equatable {
}


class PostInitial extends  PostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostLoading extends  PostState  {
  @override
  // TODO: implement props
  List<Object?> get props =>  [];


}

class PostError extends PostState{


  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class Postdone extends PostState {

  Postdone(this.post);
  List<Post> post;



  @override
  // TODO: implement props
  List<Object?> get props => [post];
}
