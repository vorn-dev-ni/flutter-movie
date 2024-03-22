import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_api_bloc/res/appcolor.dart';
import 'package:movie_app_api_bloc/res/url.dart';


import '../../presentation/bloccast/cast_bloc.dart';

class CastWidgetBuilder extends StatefulWidget {
  var id;

  CastWidgetBuilder({Key? key, this.id}) : super(key: key);

  @override
  State<CastWidgetBuilder> createState() => _CastWidgetBuilderState();
}

class _CastWidgetBuilderState extends State<CastWidgetBuilder> {
  CastBloc _block = CastBloc();

  @override
  void initState() {
    // TODO: implement initState
    _block.add(GetCastEvent(widget.id));

    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _block,
      child: Container(
        height: 130,

        child: BlocConsumer<CastBloc, CastState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
          if(state is CastLoading){
            return Center(child: CircularProgressIndicator());
          }
          if(state is CastLoadedCast){
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.item?.length ?? 0,


              itemBuilder: (context, index) {
                var cast = state.item![index];
                return Container(


                  margin: EdgeInsets.only(right: 20,top: 5),
                  child: Column(
                    children: [

                      CircleAvatar(
                          radius: 35,
                          backgroundColor: Color(Appcolor.whitecolor).withOpacity(0.86),
                          backgroundImage: NetworkImage(
                              '${ApiUrl.imageurl}${cast.profilePath}'
                          )

                      ),
                      SizedBox(height: 10,),
                      Text("${state.item![index].name}", style: TextStyle(
                          color: Colors.white
                      ),),
                      Text("${cast.character}", style: TextStyle(
                          fontSize: 11

                      ),),

                    ],
                  ),
                );
              },);
          }
          else{
            return Text("Error has been occur");
          }
          },
        ),
      ),
    );
  }
}
