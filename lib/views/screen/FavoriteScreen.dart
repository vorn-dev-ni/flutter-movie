


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:movie_app_api_bloc/favorite_bloc.dart';

import '../../res/appcolor.dart';
import '../../res/url.dart';
import 'MovieDetail.dart';

class FavoriteScreen extends StatefulWidget {

  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
// FavoriteBloc _bloc = FavoriteBloc();
  @override
  void initState() {
    // TODO: implement initState
    // context.read<FavoriteBloc>().add(FetchFav());
    BlocProvider.of<FavoriteBloc>(context).add(FetchFav());
    super.initState();
  }
  Widget build(BuildContext context) {
    print("fetch");
  // context.read<FavoriteBloc>().add(FetchFav());
  //   BlocProvider.of<FavoriteBloc>(context).add(FetchFav());
  //   _bloc.add(FetchFav());
  //   context.watch<FavoriteBloc>().add(FetchFav());
    return  BlocConsumer<FavoriteBloc,LoadFav>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
if(state is LoadFav){



    return
      state?.item.length == 0 ?
      Center(
        child: Text("You have no favorite movie in your list",style: TextStyle(
          fontSize: 12
        ),),
      ) :

      GridView.builder(

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,


          mainAxisExtent:400,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10

      ),
      itemCount: state.item.length,
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
            width: 400,
            margin: EdgeInsets.only(right: 15),
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TODO image here
                Container(
                  width: 400,

                  height: 230,

                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20)

                  ),

                  child: CachedNetworkImage(

                    imageUrl:  '${ApiUrl.imageurl}${state.item?[index].posterPath}' ,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 400,
                      height: 180,


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
                        width: 400,
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
                        overflow: TextOverflow.ellipsis,
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
                    Text(DateFormat.yMMMd().format(movie!.releaseDate!).toString(),style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w400
                    ),),
                    Row(
                      children: [

                       Icon(Icons.favorite,color: Color(Appcolor.maincolor),)
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
      child: CircularProgressIndicator(),
    );
}





    },
);
  }
}
