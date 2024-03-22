part of 'cast_bloc.dart';


abstract class CastState extends Equatable{

  CastState();
}

class CastInitial extends CastState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}


class CastLoading extends CastState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class CastLoadedCast extends CastState{
  List<Cast>? item;

  CastLoadedCast(this.item);
  @override
  // TODO: implement props
  List<Object?> get props => [item];

}

class CastError extends CastState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
