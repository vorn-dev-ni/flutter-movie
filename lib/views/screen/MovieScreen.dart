import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app_api_bloc/res/url.dart';
import 'package:movie_app_api_bloc/views/screen/MovieDetail.dart';
import 'package:movie_app_api_bloc/views/widget/comingsoonlist.dart';
import 'package:movie_app_api_bloc/views/widget/customgenretab.dart';
import 'package:movie_app_api_bloc/views/widget/scrolllistrecent.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:lottie/lottie.dart';

import '../../presentation/blocmovie/moviebloc_bloc.dart';
import '../../res/appcolor.dart';
import '../widget/scrollpopularlist.dart';

class MovieScreenHere extends StatefulWidget {

  const MovieScreenHere({Key? key}) : super(key: key);

  @override
  State<MovieScreenHere> createState() => _MovieScreenHereState();
}

class _MovieScreenHereState extends State<MovieScreenHere> {
  int _index = 0;


  MovieblocBloc _block = MovieblocBloc();

  @override
  void initState() {
    // TODO: implement initState
    // _block.add(FetchMoviePopular());
    _block.add(FetchRecentMovie());
    super.initState();

  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _block,
      child: SingleChildScrollView(

        child: LayoutBuilder(
          builder: (context, constraints) {
           return  Container(
              width: double.maxFinite,

              padding: EdgeInsets.all(15),
              child: BlocConsumer<MovieblocBloc, MovieblocState>(
                listener: (context, state) {
                  // TODO: implement listener
                  print(state);
                },
                builder: (context, state) {

                  if( state is MovieLoadingState){
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
                  if(state is MovieStateRecent){
                    var movie = state.item;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        SizedBox(height: 0,),
                        Text("Trending", style: Theme
                            .of(context)
                            .textTheme
                            .displayLarge,),
                        Container(

                            margin: EdgeInsets.only(top: 20),
                            width: double.infinity,
                            padding: EdgeInsets.all(0),

                            height:300,
                            child: PageView.builder(
                              controller: PageController(viewportFraction: 0.57,initialPage: 2,
                               keepPage: true
                              ),
                              pageSnapping: true,
                              scrollBehavior: ScrollBehavior(

                              ),

                              itemCount: state.item?.length ?? 0,

                              onPageChanged: (int index) =>
                                  setState(() => _index = index),

                              itemBuilder: (context, index) {
                                return Transform.scale(
                                  scale: index == _index ? 1 : 0.9,

                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return MovieDetailScreen(id:state.item![index].id ,);
                                          },));
                                    },
                                    child: Container(
                                      width: 205,



                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: BorderRadius.circular(20)

                                      ),

                                      child: CachedNetworkImage(
                                        imageUrl:  '${ApiUrl.imageurl}${state.item?[index].posterPath}' ,
                                        imageBuilder: (context, imageProvider) => Container(
                                          width: 205,

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(18),
                                            image: DecorationImage(
                                              image: imageProvider,

                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) {
                                          return ClipRRect(
                                            //
                                            // borderRadius: BorderRadius.circular(10),

                                            child:   Container(
                                              width: 205,
                                              // height: 280,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(18),
                                                  color:Colors.blueGrey
                                              ),
                                            ),);
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
                                  ),

                                );
                              },)
                        ),
                        SizedBox(height: 20,),
                        Text("Generes", style: Theme
                            .of(context)
                            .textTheme
                            .displayLarge,),
                        SizedBox(height: 20,),

                        CustomTabBarGenre(),
                        SizedBox(height: 20,),
                        SizedBox(height: 17,),
                        ScrollListRecent(),
                        SizedBox(height: 27,),
                        //TODO popular list
                        ScrollPopularRecent(),
                        SizedBox(height: 27,),
                        ScrollListSoon()


                      ],
                    );
                  }
                  if(state is MovieErrorState) {
                    return Center(

                        child: Text("Internal Server error...."));
                  }
                  else{
                    return Center(

                        child: Text("Try again"));
                  }

                },
              ),
            );
          },

        ),
      ),
    );
  }
}
