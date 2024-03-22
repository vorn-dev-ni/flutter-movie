import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_api_bloc/favorite_bloc.dart';

import '../../res/appcolor.dart';

class FavWidgetButton extends StatefulWidget {
  var id;

  FavWidgetButton({Key? key, this.id}) : super(key: key);

  @override
  State<FavWidgetButton> createState() => _FavWidgetButtonState();
}

class _FavWidgetButtonState extends State<FavWidgetButton> {
  FavoriteBloc _block = FavoriteBloc();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => _block,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 15, left: 10, right: 10, bottom: 20),
        child: Container(
          width: double.maxFinite,
          child: ElevatedButton.icon(
            onPressed: () {

            },
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    Color(Appcolor.maincolor)),
                alignment: Alignment.center

            ),


            icon: Icon(Icons.star_rate_sharp, size: 18,),
            label: InkWell(
              onTap: () {
                print(widget.id);
                // _block.add(AddFavoriteMovie(widget.id));
                BlocProvider.of<FavoriteBloc>(context).add(AddFavoriteMovie(widget.id));
                // context.read<FavoriteBloc >().add(AddFavoriteMovie(widget.id));
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
               ScaffoldMessenger.of(context).showSnackBar(


                   SnackBar(
                       elevation: 0,
                       backgroundColor: Theme.of(context).primaryColor,
                       content: Text("Added to your favorite")));

                Navigator.pop(context);

                print("Event add to favorite");
              },
              child: Text("Add to Your List", style: TextStyle(
                  fontSize: 16
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
