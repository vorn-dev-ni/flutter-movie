import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_api_bloc/theme/theme_bloc.dart';
import 'package:movie_app_api_bloc/views/screen/FavoriteScreen.dart';
import 'package:movie_app_api_bloc/views/screen/MovieScreen.dart';
import 'package:movie_app_api_bloc/views/screen/Searchscreen.dart';

import '../res/appcolor.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var screenlist = [
    MovieScreenHere(),
    FavoriteScreen(),
    SearchScreenHere()
  ];
 ThemeBloc _b = ThemeBloc();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: screenlist.length ?? 0,

      child: Scaffold(
        appBar: AppBar(

          backgroundColor: Color(Appcolor.bgcolor),

          elevation: 0,
          actions: [Icon(Icons.dark_mode_rounded)],
          bottom: TabBar(

              onTap: (value) => null,
              padding: EdgeInsets.all(12),
              // indicatorColor: Color(Appcolor.whitecolor).withOpacity(1),
              // labelStyle: Theme.of(context).textTheme.labelSmall,
              //
              //
              // labelColor: Color(Appcolor.maincolor),
              // unselectedLabelStyle: TextStyle(
              //   fontSize: 15
              // ),
              // unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
              // unselectedLabelColor: Color(Appcolor.whitecolor).withOpacity(1),


              tabs:
              [
                Tab(
                  child: Text("Movie"),
                ),

                Tab(
                  child: Text("Favorite"),
                ),
                Tab(
                  child: Text("Search"),
                ),

                InkWell(

                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return SearchScreenHere();
                      },));
                    },
                    child: Icon(Icons.search)),

              ]

          ),
        ),

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
                children: screenlist.map((e) {
                  return e;
                }).toList()

            ),
          ),
        ),
      ),
    );
  }
}
