

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_api_bloc/res/url.dart';
import 'package:movie_app_api_bloc/views/screen/Searchscreen.dart';


import '../../presentation/blocmovie/moviebloc_bloc.dart';
import '../../res/appcolor.dart';
import 'MovieDetail.dart';

class ListMoviescreen extends StatefulWidget {
  var choice;
  var movieid;
  var apptitle;
 ListMoviescreen ({Key? key,this.choice,this.movieid,this.apptitle}) : super(key: key);

  @override
  State<ListMoviescreen> createState() => _ListMoviescreenState();
}

class _ListMoviescreenState extends State<ListMoviescreen> {
  MovieblocBloc _bloc = MovieblocBloc();
  @override
  void initState() {
    // TODO: implement initState
    print(widget.choice);
    switch(widget.choice){
      case 1:
        _bloc.add(FetchRecentMovie());
      case 2:
        // _bloc.add( FetchTopMovie() );
      case 3:
        _bloc.add(FetchUpcoming());
      default:
        _bloc.add(FetchGenreById(widget.movieid));
        break;
        
    }
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        backgroundColor:Color(Appcolor.bgcolor),
        title:Text("${widget.apptitle ?? "Movies"}"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,


                    MaterialPageRoute(
                      fullscreenDialog: true,

                      builder: (context) {
                        return SearchScreenHere();
                      },));
              },
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
      body: BlocProvider(
  create: (context) => _bloc,
  child: SafeArea(
        child: BlocConsumer<MovieblocBloc, MovieblocState>(
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
      else if(state is MovieUpcoming){
        return GridView.builder(

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,


              mainAxisExtent:350,
              mainAxisSpacing: 15,
              crossAxisSpacing: 25

          ),
          itemCount:state.item?.length ?? 0,
          padding: EdgeInsets.all(15),


          itemBuilder:(context, index) {
            var movie = state.item?[index];
            return            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MovieDetailScreen(id:state.item?[index].id ,);
                },));
              },
              child: Container(
                height: double.maxFinite,


                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(

                      height: 250,
                      // height: 250,

                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10)

                      ),

                      child: CachedNetworkImage(

                        imageUrl:  '${ApiUrl.imageurl}${state.item?[index].posterPath}' ,
                        imageBuilder: (context, imageProvider) => Container(

                          height: 280,


                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

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
                    // Container(
                    //
                    //   child: ClipRRect(
                    //     borderRadius:BorderRadius.circular(10) ,
                    //     child: Image.network('${ApiUrl.imageurl}${movie.posterPath}'
                    //
                    //       ,fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text("${movie?.title}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: Theme.of(context).textTheme.displayLarge,),
                        ),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.date_range,color: Color(Appcolor.whitecolor).withOpacity(0.5),size: 15,),
                              SizedBox(width: 10,),
                              Text(DateFormat.yMMMd().format(movie!.releaseDate!),style: Theme.of(context).textTheme.displayMedium,),
                            ],
                          ),
                        ),

                        Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),

                            // color: Color(Appcolor.maincolor),


                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.bookmark,
                                color: Color(Appcolor.maincolor).withOpacity(0.5),size: 16,),
                              SizedBox(width: 3,),
                              Text("${movie?.originalLanguage}",style:TextStyle(
                                  color: Color(Appcolor.maincolor),
                                  fontSize: 12
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            );
          },

        );
      }
      // else if(state is MovieStatePopular){
      //   return GridView.builder(
      //
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
      //
      //
      //         mainAxisExtent:350,
      //         mainAxisSpacing: 15,
      //         crossAxisSpacing: 25
      //
      //     ),
      //     itemCount:state.item?.length ?? 0,
      //     padding: EdgeInsets.all(15),
      //
      //
      //     itemBuilder:(context, index) {
      //       var movie = state.item?[index];
      //       return            InkWell(
      //         onTap: () {
      //           Navigator.push(context, MaterialPageRoute(builder: (context) {
      //             return MovieDetailScreen(id:state.item?[index].id ,);
      //           },));
      //         },
      //         child: Container(
      //           height: double.maxFinite,
      //
      //
      //           child:
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Container(
      //
      //                 height: 250,
      //                 // height: 250,
      //
      //                 decoration: BoxDecoration(
      //                     color: Colors.blueGrey,
      //                     borderRadius: BorderRadius.circular(10)
      //
      //                 ),
      //
      //                 child: CachedNetworkImage(
      //
      //                   imageUrl:  '${ApiUrl.imageurl}${state.item?[index].posterPath}' ,
      //                   imageBuilder: (context, imageProvider) => Container(
      //
      //                     height: 280,
      //
      //
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(10),
      //
      //                       image: DecorationImage(
      //                         image: imageProvider,
      //
      //
      //                         fit: BoxFit.cover,
      //                       ),
      //                     ),
      //                   ),
      //                   placeholder: (context, url) {
      //                     return Container(
      //                       width: 205,
      //                       // height: 280,
      //                       decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(18),
      //                           color:Colors.blueGrey
      //                       ),
      //                     );
      //                   },
      //                   // child: ClipRRect(
      //                   //   borderRadius: BorderRadius.circular(20),
      //                   //   child: Image.network(
      //                   //     '${ApiUrl.imageurl}${state.item?[index].posterPath}',
      //                   //     fit: BoxFit.cover,
      //                   //     alignment: Alignment.center,
      //                   //   ),
      //                   // ),
      //                 ),
      //               ),
      //               // Container(
      //               //
      //               //   child: ClipRRect(
      //               //     borderRadius:BorderRadius.circular(10) ,
      //               //     child: Image.network('${ApiUrl.imageurl}${movie.posterPath}'
      //               //
      //               //       ,fit: BoxFit.cover,
      //               //     ),
      //               //   ),
      //               // ),
      //               SizedBox(height: 10,),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Expanded(
      //                     child: Text("${movie?.title}",
      //                       maxLines: 1,
      //                       overflow: TextOverflow.ellipsis,
      //
      //                       style: Theme.of(context).textTheme.displayLarge,),
      //                   ),
      //
      //                 ],
      //               ),
      //               SizedBox(height: 10,),
      //               Row(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Expanded(
      //
      //                     child: Row(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Icon(Icons.date_range,color: Color(Appcolor.whitecolor).withOpacity(0.5),size: 15,),
      //                         SizedBox(width: 10,),
      //                         Text('date',style: Theme.of(context).textTheme.displayMedium,),
      //                       ],
      //                     ),
      //                   ),
      //
      //                   Container(
      //
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(8),
      //
      //                       // color: Color(Appcolor.maincolor),
      //
      //
      //                     ),
      //                     child: Row(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Icon(Icons.bookmark,
      //                           color: Color(Appcolor.maincolor).withOpacity(0.5),size: 16,),
      //                         SizedBox(width: 3,),
      //                         Text("${movie?.originalLanguage}",style:TextStyle(
      //                             color: Color(Appcolor.maincolor),
      //                             fontSize: 12
      //                         ),),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //
      //             ],
      //           ),
      //         ),
      //       );
      //     },
      //
      //   );
      // }
      else if(state is MovieTopRatedState ){
        return GridView.builder(

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,


              mainAxisExtent:350,
              mainAxisSpacing: 15,
              crossAxisSpacing: 25

          ),
          itemCount:state.item?.length ?? 0,
          padding: EdgeInsets.all(15),


          itemBuilder:(context, index) {
            var movie = state.item?[index];
            return            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MovieDetailScreen(id:state.item?[index].id ,);
                },));
              },
              child: Container(
                height: double.maxFinite,


                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(

                      height: 250,
                      // height: 250,

                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10)

                      ),

                      child: CachedNetworkImage(

                        imageUrl:  '${ApiUrl.imageurl}${state.item?[index].posterPath}' ,
                        imageBuilder: (context, imageProvider) => Container(

                          height: 280,


                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

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
                    // Container(
                    //
                    //   child: ClipRRect(
                    //     borderRadius:BorderRadius.circular(10) ,
                    //     child: Image.network('${ApiUrl.imageurl}${movie.posterPath}'
                    //
                    //       ,fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text("${movie?.title}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: Theme.of(context).textTheme.displayLarge,),
                        ),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.date_range,color: Color(Appcolor.whitecolor).withOpacity(0.5),size: 15,),
                              SizedBox(width: 10,),
                              Text('',style: Theme.of(context).textTheme.displayMedium,),
                            ],
                          ),
                        ),

                        Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),

                            // color: Color(Appcolor.maincolor),


                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.bookmark,
                                color: Color(Appcolor.maincolor).withOpacity(0.5),size: 16,),
                              SizedBox(width: 3,),
                              Text("${movie?.originalLanguage}",style:TextStyle(
                                  color: Color(Appcolor.maincolor),
                                  fontSize: 12
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            );
          },

        );
      }
      else if(state is MovieStateRecent){
        return GridView.builder(

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,


              mainAxisExtent:350,
              mainAxisSpacing: 15,
              crossAxisSpacing: 25

          ),
          itemCount:state.item?.length ?? 0,
          padding: EdgeInsets.all(15),


          itemBuilder:(context, index) {
            var movie = state.item?[index];
            return            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MovieDetailScreen(id:state.item?[index].id ,);
                },));
              },
              child: Container(
                height: double.maxFinite,


                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(

                      height: 250,
                      // height: 250,

                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10)

                      ),

                      child: CachedNetworkImage(

                        imageUrl:  '${ApiUrl.imageurl}${state.item?[index].posterPath}' ,
                        imageBuilder: (context, imageProvider) => Container(

                          height: 280,


                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

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
                    // Container(
                    //
                    //   child: ClipRRect(
                    //     borderRadius:BorderRadius.circular(10) ,
                    //     child: Image.network('${ApiUrl.imageurl}${movie.posterPath}'
                    //
                    //       ,fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text("${movie?.title}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: Theme.of(context).textTheme.displayLarge,),
                        ),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.date_range,color: Color(Appcolor.whitecolor).withOpacity(0.5),size: 15,),
                              SizedBox(width: 10,),
                              Text('',style: Theme.of(context).textTheme.displayMedium,),
                            ],
                          ),
                        ),

                        Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),

                            // color: Color(Appcolor.maincolor),


                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.bookmark,
                                color: Color(Appcolor.maincolor).withOpacity(0.5),size: 16,),
                              SizedBox(width: 3,),
                              Text("${movie?.originalLanguage}",style:TextStyle(
                                  color: Color(Appcolor.maincolor),
                                  fontSize: 12
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            );
          },

        );
      }
      else if(state is MoviebyGenre){
        return GridView.builder(

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,


              mainAxisExtent:350,
              mainAxisSpacing: 15,
              crossAxisSpacing: 25

          ),
          itemCount:state.item?.length ?? 0,
          padding: EdgeInsets.all(15),


          itemBuilder:(context, index) {
            var movie = state.item?[index];
            return            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MovieDetailScreen(id:state.item?[index].id ,);
                },));
              },
              child: Container(
                height: double.maxFinite,


                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(

                      height: 250,
                      // height: 250,

                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10)

                      ),

                      child: CachedNetworkImage(

                        imageUrl:  '${ApiUrl.imageurl}${state.item?[index].posterPath}' ,
                        imageBuilder: (context, imageProvider) => Container(

                          height: 280,


                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

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
                    // Container(
                    //
                    //   child: ClipRRect(
                    //     borderRadius:BorderRadius.circular(10) ,
                    //     child: Image.network('${ApiUrl.imageurl}${movie.posterPath}'
                    //
                    //       ,fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text("${movie?.title}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: Theme.of(context).textTheme.displayLarge,),
                        ),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.date_range,color: Color(Appcolor.whitecolor).withOpacity(0.5),size: 15,),
                              SizedBox(width: 10,),
                              Text('',style: Theme.of(context).textTheme.displayMedium,),
                            ],
                          ),
                        ),

                        Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),

                            // color: Color(Appcolor.maincolor),


                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.bookmark,
                                color: Color(Appcolor.maincolor).withOpacity(0.5),size: 16,),
                              SizedBox(width: 3,),
                              Text("${movie?.originalLanguage}",style:TextStyle(
                                  color: Color(Appcolor.maincolor),
                                  fontSize: 12
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            );
          },

        );
      }

      else{
        return Center(
          child: Text("Error has been occur"),
        );
      }

  },
),
      ),
) ,
    );
  }
}
// ListTile(
// contentPadding: EdgeInsets.all(0),
// autofocus: true,
// isThreeLine: true,
// leading:
// Container(
// width: 100,
// height: 100,
// child: Image.network('https://www.movieposters.com/cdn/shop/products/108b520c55e3c9760f77a06110d6a73b_240x360_crop_center.progressive.jpg?v=1573652543'
// ,fit: BoxFit.cover,
//
// ),
// ),
// title: Text("Avenger Endgame",style: Theme.of(context).textTheme.displayLarge,),
// subtitle: Text("Avenger Endgame",style: Theme.of(context).textTheme.displayMedium,),
//
// ),