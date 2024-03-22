import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/Product.dart';
import '../../repository/ApiRepository.dart';



part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
   ApiRepository _apiRepository = ApiRepository();
  PostBloc() : super(PostInitial()) {
      on<GetPostList>((event, emit) async {
        try{
          emit(PostLoading());
       var postlist = await _apiRepository.getalluser();

          emit(Postdone(postlist));
        }catch(error){
               emit(PostError());
        }

      });
  }
}
