import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_api_bloc/repository/ApiRepository.dart';

import '../../models/CastModel.dart';



part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  ApiRepository _apiRepository = ApiRepository();
  CastBloc() : super(CastInitial()) {
    on<GetCastEvent>((event, emit) async  {
      // TODO: implement event handler
      emit(CastLoading());
      try{
        var crew = await _apiRepository.getmoviedetail(event.id);
        emit(CastLoadedCast(crew));

      }catch(error){
        print(error);
        emit(CastError());
      }
    });
  }
}
