import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app_api_bloc/views/MovieDetail.dart';
import 'package:movie_app_api_bloc/views/screen/MovieDetail.dart';

import '../models/MovieModel.dart';
import '../presentation/blocmovie/moviebloc_bloc.dart';


class Moviepage extends StatefulWidget {

  const Moviepage({Key? key}) : super(key: key);

  @override
  State<Moviepage> createState() => _MoviepageState();
}

class _MoviepageState extends State<Moviepage> {
  final MovieblocBloc _bloc = MovieblocBloc();

  @override
  void initState() {
    // TODO: implement initState
    _bloc.add(FetchMovieEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    print("object");

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Movies"),
      ),

      body: BlocProvider(
        create: (context) => _bloc,
        child: BlocConsumer<MovieblocBloc, MovieblocState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is MovieFetchState) {
              print(state.item?.length);
              var movie =state.item;


              return ListView.builder(

                

                itemCount: movie.length,
                

                itemBuilder: (context, index) {


                

                  return InkWell(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder:(context) {
                        return MovieDetailScreen(id: movie[index].id,);
                      },));
                    },
                    child: Card(

                      child: ListTile(
                        subtitle: Text('${movie[index].title}'),


                      ),
                    ),
                  );
                },);
            }
            if (state is MovieLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              return Text("Error has occur");
            }





          },
        ),
      ),
    );
  }
}
