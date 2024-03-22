import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/bloccast/cast_bloc.dart';


class MovieDetail extends StatefulWidget {
  var id;

  MovieDetail({Key? key, this.id}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  CastBloc _block = CastBloc();

  @override
  void initState() {
    // TODO: implement initState
    print(widget.id);
    _block.add(GetCastEvent(widget.id));

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => _block,
        child: BlocConsumer<CastBloc, CastState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if(state is CastLoadedCast){
              return ListView.builder(
                itemCount: state.item?.length ?? 0,
                itemBuilder: (context, index) {

                  return Container(
                    width: double.maxFinite,

                    child: Card(
                      child: ListTile(
                        title:      Text("${state.item?[index].name}"),

                        leading:  CircleAvatar(
    //https://image.tmdb.org/t/p/w500/WCSZzWdtPmdRxH9LUCVi2JPCSJ.jpg
                          backgroundImage: NetworkImage("https://image.tmdb.org/t/p/w500${state.item?[index].profilePath}"),
                        ),
                        trailing:  Text("${state.item?[index].popularity}"),
                      )
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
        ),
      ),
    );
  }
}
