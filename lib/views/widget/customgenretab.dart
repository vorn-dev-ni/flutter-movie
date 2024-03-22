import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:movie_app_api_bloc/views/screen/ListMovieScreen.dart';

import '../../presentation/blocmovie/moviebloc_bloc.dart';
import '../../res/appcolor.dart';

class CustomTabBarGenre extends StatefulWidget {


  const CustomTabBarGenre({Key? key}) : super(key: key);

  @override
  State<CustomTabBarGenre> createState() => _CustomTabBarGenreState();
}

class _CustomTabBarGenreState extends State<CustomTabBarGenre> {
  MovieblocBloc _bloc = MovieblocBloc();
  var indicator =0;
  var click = false;
@override
  void initState() {
    // TODO: implement initState
  _bloc.add(FetchGenre());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: Container(
        height: 40,

        child: BlocConsumer<MovieblocBloc, MovieblocState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if(state is MovieLoadingState){
              return Row(
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

            if(state is MovieGenre){
              return ListView.builder(
                itemCount:state.item?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if(index == 0 &&click == false){
                  return   Container(
                    margin: EdgeInsets.only(right: 20),
                    alignment: Alignment.center,


                    width: 100,
                    decoration: BoxDecoration(
                        color:

                        Color(Appcolor.maincolor),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: Color(Appcolor.secondarybg).withOpacity(0.5)
                        )
                    ),
                    child:



                    Text("All", style: TextStyle(
                        fontSize: 12,
                        color: Color(Appcolor.whitecolor)
                    ),

                    ),
                  );
                  }
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,


                          MaterialPageRoute(
                            fullscreenDialog: true,

                            builder: (context) {
                              return ListMoviescreen(choice: 5,movieid:state.item![index].id ,apptitle: state.item![index].name,);
                            },));
                      setState(() {
                        indicator = index;
                        click = true;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      alignment: Alignment.center,


                      width: 100,
                      decoration: BoxDecoration(
                          color:
                          indicator == index ?
                          Color(Appcolor.maincolor) :
                          Color(Appcolor.bgcolor)


                          ,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color:


                              indicator == index ?

                              Color(Appcolor.whitecolor).withOpacity(0) :

                              Color(Appcolor.whitecolor).withOpacity(0.5)
                          )
                      ),
                      child:



                      Text("${state.item![index].name}", style: TextStyle(
                        fontSize: 12,
                          color: Color(Appcolor.whitecolor)
                      ),

                      ),
                    ),
                  );
                },);
            }
            else{
                return Center(
                  child: Text("No internet, try again"),
                );
            }

          },
        ),
      ),
    );
  }
}
