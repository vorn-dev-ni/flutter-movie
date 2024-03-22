

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


import '../../presentation/blocmovie/moviebloc_bloc.dart';
import '../../res/url.dart';
import '../screen/ListMovieScreen.dart';
import '../screen/MovieDetail.dart';

class ScrollListSoon extends StatefulWidget {
  const ScrollListSoon({Key? key}) : super(key: key);

  @override
  State<ScrollListSoon> createState() => _ScrollListSoonState();
}

class _ScrollListSoonState extends State<ScrollListSoon> {
  MovieblocBloc _bloc = MovieblocBloc();
  @override
  void initState() {
    // TODO: implement initState
    _bloc.add(FetchUpcoming());
    super.initState();
  }
  Widget build(BuildContext context) {
    return      BlocProvider(
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
              Text("Upcoming",style: Theme.of(context).textTheme.displayLarge,),
              InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ListMoviescreen(choice: 3,);
                    },));
                  },

                  child: Text("See All",style: Theme.of(context).textTheme.labelSmall,)),
            ],
          ),
          SizedBox(height: 7,),
          BlocConsumer<MovieblocBloc, MovieblocState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if(state is MovieUpcoming){
      return Expanded(child: ListView.builder(
        itemCount: state.item.length,
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          var movie = state.item[index];
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
                  //TODO image here
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
                        child: Text("${movie.title}",


                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.fade,
                          maxLines: 1,


                          softWrap: false,

                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.people,size: 18,color: Colors.white.withOpacity(0.5),),
                          Text(" ${movie.popularity}",style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontWeight: FontWeight.w400
                          ),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 7,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat.yMd().format(movie!.releaseDate!).toString(),style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontWeight: FontWeight.w400
                      ),),
                      Row(
                        children: [

                          Text("${movie.originalLanguage}",style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontWeight: FontWeight.w400
                          ),),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),
          );
        },));
    }
    else{
      return Center(
        child: CircularProgressIndicator(),
      );
    }

  },
)
        ],
      ),
    ),
);
  }
}
