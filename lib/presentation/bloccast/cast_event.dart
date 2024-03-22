part of 'cast_bloc.dart';


abstract class CastEvent {}

class GetCastEvent extends CastEvent{
  var id;

  GetCastEvent(this.id);
}
