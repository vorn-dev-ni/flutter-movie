

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';


import '../../presentation/blocmovie/moviebloc_bloc.dart';
import '../../res/appcolor.dart';
import '../../res/url.dart';
import 'MovieDetail.dart';

class SearchScreenHere extends StatefulWidget {

  const SearchScreenHere  ({Key? key}) : super(key: key);

  @override
  State<SearchScreenHere> createState() => _SearchScreenHereState();
}

class _SearchScreenHereState extends State<SearchScreenHere> {
  MovieblocBloc _bloc = MovieblocBloc();
  var txtquery = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    _bloc.add( FetchTopMovie() );
    
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor:Color(Appcolor.bgcolor),
        title:           Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: txtquery,
                  onTap: () {

                  },
                  onSaved: (newValue) {
                    setState(() {
                      txtquery.text = newValue.toString();
                    });
                  },
                  onChanged: (value) {
                    print(value.toString());
                    _bloc.add(SearchMovie(value.toString()));
                  },
                  onFieldSubmitted: (value) {
                   txtquery.text = value.toString();
                   _bloc.add(SearchMovie(txtquery.text));
                  },
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(Appcolor.whitecolor).withOpacity(0.75)
                  ),

                  decoration:InputDecoration(
                      label: Text("Search Movie",style: TextStyle(
                          fontSize: 10,
                          color: Colors.white.withOpacity(0.5)
                      ),),
                      filled: true  ,
                      counterStyle: TextStyle(
                        color: Colors.white
                      ),
                      prefixIcon: Icon(Icons.search,     color: Color(Appcolor.whitecolor).withOpacity(0.5),),

                      contentPadding: EdgeInsets.all(0),

                      fillColor: Color(Appcolor.bgcolor2).withOpacity(0.37),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none

                      ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(Appcolor.whitecolor).withOpacity(0.5)
                        )
                    )
                  ) ,
                ),
              ),
              SizedBox(width: 10,),
              InkWell(
                onTap: () {
                  _bloc.add(SearchMovie(txtquery.text));
                },
                child: Text("Search",style: TextStyle(
    fontSize: 10,
                  color: Color(Appcolor.lastcolor)
    )),
              )

            ],
          ),
        ),


      ),
      body: BlocProvider(
  create: (context) =>_bloc,
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
    if(state is MovieTopRatedState) {
      return GridView.builder(

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,


            mainAxisExtent:350,
            mainAxisSpacing: 10,
            crossAxisSpacing: 15

        ),
        itemCount:state.item?.length ?? 0,
        padding: EdgeInsets.all(15),


        itemBuilder:(context, index) {
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

                    height: 240,
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
                      // Row(
                      //   children: [
                      //     Icon(Icons.people,size: 18,color: Colors.white.withOpacity(0.5),),
                      //     Text(" ${movie.popularity}",style: TextStyle(
                      //         color: Colors.white.withOpacity(0.5),
                      //         fontWeight: FontWeight.w400
                      //     ),),
                      //   ],
                      // ),
                    ],
                  ),
                  SizedBox(height: 7,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat.yMd().format(movie!.releaseDate!),style: TextStyle(
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
        },

      );
    }

    if(state is MovieTitleQuery) {
      return
        state.item?.length == 0 ?
            Center(
              child: Text("Sorry, we could't find any movie"),
            ):
        GridView.builder(

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,


              mainAxisExtent:350,
              mainAxisSpacing: 10,
              crossAxisSpacing: 15

          ),
          itemCount:state.item?.length ?? 0,
          padding: EdgeInsets.all(15),


          itemBuilder:(context, index) {
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

                      height: 240,
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
                        // Row(
                        //   children: [
                        //     Icon(Icons.people,size: 18,color: Colors.white.withOpacity(0.5),),
                        //     Text(" ${movie.popularity}",style: TextStyle(
                        //         color: Colors.white.withOpacity(0.5),
                        //         fontWeight: FontWeight.w400
                        //     ),),
                        //   ],
                        // ),
                      ],
                    ),
                    SizedBox(height: 7,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(DateFormat.yMd().format(movie!.releaseDate!),style: TextStyle(
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
          },

        );
    }
    else{
      return Center(
        child: Text("Try again"),
      );
    }

  },
),
      ),
) ,
    );
  }
}
