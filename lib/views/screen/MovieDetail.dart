

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import 'package:movie_app_api_bloc/favorite_bloc.dart';
import 'package:movie_app_api_bloc/res/url.dart';
import 'package:movie_app_api_bloc/views/widget/FavWidgetButton.dart';
import 'package:movie_app_api_bloc/views/widget/castwidget.dart';


import '../../presentation/blocmovie/moviebloc_bloc.dart';
import '../../res/appcolor.dart';

class MovieDetailScreen extends StatefulWidget {
  var id;
 MovieDetailScreen ({Key? key,this.id}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieblocBloc _block = MovieblocBloc();

  @override
  void initState() {
    // TODO: implement initState
    _block.add(FetchMovieDetail(widget.id));

    print(widget.id);
    super.initState();

  }
  Widget build(BuildContext context) {

    // BlocProvider.of<CastBloc>(context).add(GetCastEvent(widget.id));
    print("detail movie");
    return Scaffold(
      appBar:null ,

      body: SafeArea(
        child:BlocProvider(
  create: (context) => _block,
  child: BlocConsumer<MovieblocBloc,MovieblocState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if(state is MovieLoadingState){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(
            child: Lottie.asset('assets/lotties/animation_lma3ojwu.json',

                fit: BoxFit.cover,
              alignment: Alignment.center



            ),
          ),
        ],
      );
    }
    if(state is MovieDetail){
      var movie = state.item;
      return CustomScrollView(
        slivers: [
          //TODO sliver app bar
          SliverAppBar(
            elevation: 0,
            expandedHeight: 450,
            actions: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //
              //   child: CircleAvatar
              //
              //     (
              //       backgroundColor: Color(Appcolor.maincolor),
              //       child: Icon(
              //         Icons.favorite,
              //
              //
              //
              //         color: Color(Appcolor.whitecolor),
              //       )),
              // )
            ],

   backgroundColor: Color(Appcolor.bgcolor2).withOpacity(0.85),
            flexibleSpace: FlexibleSpaceBar(

              title: Text(""),

              background:
              state.item?.posterPath == null ?
              Container(
                color: Colors.white,
                height: double.maxFinite,
              )

             : Image.network('${ApiUrl.v2imageurl}${state.item?.posterPath}'
                ,fit: BoxFit.cover,),

            ),
          ),
          SliverToBoxAdapter(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  BlocConsumer<MovieblocBloc, MovieblocState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text("${movie?.title}",
                                maxLines: 2,

                                overflow: TextOverflow.ellipsis,


                                style: TextStyle(
                                  fontSize: 20,
                                    overflow: TextOverflow.ellipsis,
                                  color: Colors.white
                              ),),
                            ),
                            Row(
                              children: [
                                Icon(Icons.people_sharp,size: 20,),
                                SizedBox(width: 10,),
                                Text("${movie?.popularity}",style: Theme.of(context).textTheme.bodyMedium,),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 15,),

                  Padding(
                    padding: const EdgeInsets.only(top: 5,left: 20,right: 0),
                    child: Container(
                      height: 35,
                      child: ListView.builder(
                        itemCount: movie?.genres?.length ?? 0,
                        scrollDirection: Axis.horizontal,

                        itemBuilder: (context, index) {
                        return
                          Container(



                            child:
                            Text("${movie?.genres![index].name}",style: Theme.of(context).textTheme.bodyMedium,),
                            decoration: BoxDecoration(
                                color: Color(Appcolor.bgcolor2).withOpacity(0.55),
                                borderRadius:  BorderRadius.circular(12)
                            ),
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(right: 15),


                          );
                      },),
                    )
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(top: 5,left: 20,right: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Container(
                            decoration: BoxDecoration(
                                color: Color(Appcolor.bgcolor2).withOpacity(0.55),
                                borderRadius:  BorderRadius.circular(12)
                            ),
                            padding: EdgeInsets.all(6),
                            child: Text(DateFormat.yMMMd().format(movie!.releaseDate!),style: Theme.of(context).textTheme.bodyMedium,)),
                        // Container(
                        //
                        //     decoration: BoxDecoration(
                        //         color: Color(Appcolor.bgcolor2),
                        //         borderRadius:  BorderRadius.circular(12)
                        //     ),
                        //     padding: EdgeInsets.all(4),
                        //     child: Text("${movie.originalTitle}",style: Theme.of(context).textTheme.bodyMedium,)),
              SizedBox(width: 10,),
                        Container(
                            decoration: BoxDecoration(
                                color: Color(Appcolor.bgcolor2).withOpacity(0.55),
                                borderRadius:  BorderRadius.circular(12)
                            ),
                            padding: EdgeInsets.all(6),
                            child: Text("${movie.runtime}min",style: Theme.of(context).textTheme.bodyMedium,)),
                        SizedBox(width: 10,),
                        Container(

                            decoration: BoxDecoration(
                                color: Color(Appcolor.maincolor),
                                borderRadius:  BorderRadius.circular(12)
                            ),
                            padding: EdgeInsets.all(4),
                            child: Text("${movie.status}",style: Theme.of(context).textTheme.headlineSmall,)),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  //TODO description
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text("Sinopsis",style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),),
                        SizedBox(height: 10,),

                        Text('${movie.overview}',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          maxLines: 6,



                          style: Theme.of(context).textTheme.displayMedium,


                        ),
                      ],),
                  ),
                  SizedBox(height: 15,),
                  //TODO caster and crew mate
                  Container(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25,right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text("Cast",style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),),
                          SizedBox(height: 10,),

                    CastWidgetBuilder(id: widget.id,)
                        ],),
                    ),
                  ),
                  SizedBox(height: 15,),
                  FavWidgetButton(id: widget.id,)

                ],
              ),
            ),
          )


        ],
      );
    }
    else{
      return Center(
        child:Text("Error")
      );
    }

  },
),
),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //
      //
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //
      //   },
      //   label: Text("Add to Favorite",style: TextStyle(
      //     fontSize: 14,
      //   ),),
      //   icon: Icon(Icons.star),
      //   shape:  RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(10)
      //   ),
      //   extendedPadding: EdgeInsets.all(60),
      //
      //   elevation: 0,
      //   backgroundColor: Color(Appcolor.lastcolor),
      //
      //
      // ),
    );
  }
}
