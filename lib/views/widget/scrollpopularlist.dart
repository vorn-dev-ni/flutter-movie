

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_api_bloc/res/url.dart';

import '../../presentation/blocmovie/moviebloc_bloc.dart';
import '../screen/ListMovieScreen.dart';
import '../screen/MovieDetail.dart';

class ScrollPopularRecent extends StatefulWidget {
  const  ScrollPopularRecent({Key? key}) : super(key: key);

  @override
  State<ScrollPopularRecent> createState() => _ScrollPopularRecentState();
}

class _ScrollPopularRecentState extends State<ScrollPopularRecent> {

  MovieblocBloc _bloc = MovieblocBloc();
  @override
  void initState() {
    // TODO: implement initState
    _bloc.add( FetchTopMovie() );
    super.initState();
  }
  Widget build(BuildContext context) {
    return             BlocProvider(
  create: (context) => _bloc,
  child: Container(
      width: double.maxFinite,
      height: 400,
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Top Rated",style: Theme.of(context).textTheme.displayLarge,),
              InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ListMoviescreen(choice: 2,);
                    },));
                  },

                  child: Text("See All",style: Theme.of(context).textTheme.labelSmall,)),
            ],
          ),
          SizedBox(height: 7,),
          Expanded(child: BlocConsumer<MovieblocBloc, MovieblocState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if(state is MovieLoadingState) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/lotties/animation_lma3ojwu.json',

              fit: BoxFit.cover,
              alignment: Alignment.topCenter


          ),
        ],
      );
    }
    if(state is MovieTopRatedState){
      var movie = state.item;
      return ListView.builder(
        itemCount: movie.length,
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MovieDetailScreen(id:state.item[index].id ,);
              },));
            },
            child: Container(
              width: 200,
              margin: EdgeInsets.only(right: 15),
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TODO image here corder here
                  Container(
                    width: 205,

                    height: 280,

                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20)

                    ),

                    child: CachedNetworkImage(

                      imageUrl:  '${ApiUrl.imageurl}${state.item?[index].posterPath}' ,
                      imageBuilder: (context, imageProvider) => Container(
                        width: 205,
                        height: 280,


                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),

                          image: DecorationImage(
                            image: imageProvider,


                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) {
                        return Container(
                          width: 205,
                          // height: 280,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color:Colors.blueGrey
                          ),
                        );
                      },
                      // child: ClipRRect(
                      //   borderRadius: BorderRadius.circular(20),
                      //   child: Image.network(
                      //     '${ApiUrl.imageurl}${state.item?[index].posterPath}',
                      //     fit: BoxFit.cover,
                      //     alignment: Alignment.center,
                      //   ),
                      // ),
                    ),
                  ),
                  //TODO dialog

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text("${movie[index].title}",


                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.fade,
                          maxLines: 1,


                          softWrap: false,

                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.people,size: 18,

                            color: Colors.white.withOpacity(0.5),


                          ),
                          Text(" ${movie[index].popularity}",
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 7,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat.yMMMd().format(movie![index].releaseDate!),
                style: Theme.of(context).textTheme.bodyLarge),


                      Row(
                        children: [

                          Text("${movie[index].originalLanguage}",
                            style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),
          );
        },);
    }
    else{
      return Center(
        child: CircularProgressIndicator(),
      );
    }

  },
))
        ],
      ),
    ),
);
  }
}
