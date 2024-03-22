import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app_api_bloc/favorite_bloc.dart';
import 'package:movie_app_api_bloc/presentation/bloc/post_bloc.dart';
import 'package:movie_app_api_bloc/presentation/bloccast/cast_bloc.dart';
import 'package:movie_app_api_bloc/presentation/blocmovie/moviebloc_bloc.dart';
import 'package:movie_app_api_bloc/res/appcolor.dart';
import 'package:movie_app_api_bloc/theme/theme_bloc.dart';
import 'package:movie_app_api_bloc/views/MovieAllView.dart';
import 'package:movie_app_api_bloc/views/MovieHomePage.dart';
import 'package:movie_app_api_bloc/views/screen/FavoriteScreen.dart';
import 'package:movie_app_api_bloc/views/screen/MovieScreen.dart';
import 'package:movie_app_api_bloc/views/screen/Searchscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  var screenlist = [
    MovieScreenHere(),
    FavoriteScreen(),
    SearchScreenHere(),
    SearchScreenHere()
  ];
  ThemeBloc blocd = ThemeBloc();

  var thememode = "dark";
  var t = false;

  @override
  void initState() {
    // TODO: implement initState
    blocd.add(GetTheme());
    super.initState();
  }
  Widget build(BuildContext context) {
    // BlocProvider.of<ThemeBloc>(context).add(GetTheme());
    print("App build");
    return MultiBlocProvider(
      providers: [


        BlocProvider(create: (context) => PostBloc(),),

        BlocProvider(create: (context) => MovieblocBloc(),),
        BlocProvider(create: (context) => CastBloc(),),
        BlocProvider(create: (context) => FavoriteBloc(),),
        BlocProvider(create: (context) => ThemeBloc(),),

      ],
      child: BlocProvider(
        create: (context) =>  blocd ,
        child: BlocConsumer<ThemeBloc,ThemeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme:
              thememode == "dark" ?

              state.data :
              ThemeData(
                fontFamily: 'Poppin',
                primaryColor: Color(Appcolor.whitecolor),
                textSelectionTheme: TextSelectionThemeData(
                  selectionColor: Color(Appcolor.maincolor)
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor:     Colors.white,
                  foregroundColor: Colors.black
                ),
                iconTheme: IconThemeData(

                color: Colors.black),


                textTheme: TextTheme(
                    displayLarge: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black

                    ),
                    labelSmall: TextStyle(
                      fontSize: 12,
                      color: Color(Appcolor.maincolor),
                      fontWeight: FontWeight.w400,
                      // color: Color(Appcolor.maincolor).withOpacity(0.5)
                    ),

                    titleLarge: TextStyle(fontSize: 18,
                      overflow: TextOverflow.ellipsis,


                      fontWeight: FontWeight.w500,

                        color: Color(Appcolor.bgcolor),

                    ),
                    displayMedium: TextStyle(fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        height: 1.36

                    ),

                    bodyMedium: TextStyle(
                        fontSize: 15,
            color: Colors.black),
                    titleMedium: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600,
                        color: Colors.black),
                    titleSmall: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400,
                        color: Colors.black),
                    displaySmall: TextStyle(fontSize: 10, color: Colors.black),
                    labelMedium: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                    ),
                    bodySmall: TextStyle(
                        fontSize: 14, color: Colors.grey
                    ),

                    headlineSmall:TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                    ),
                    labelLarge: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),

                  bodyLarge:
                  TextStyle(
                    color: Colors.black.withOpacity(0.55),
                    fontWeight: FontWeight.w400,


                  ),


                ),
                scaffoldBackgroundColor:          Colors.white,

              )

              ,
              home:   DefaultTabController(
                initialIndex: 0,
                length: screenlist.length ?? 0,

                child: Scaffold(
                  appBar: AppBar(


                    backgroundColor: Theme
                        .of(context).appBarTheme.backgroundColor,

                    elevation: 0,
                    actions: [Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {

                          setState(() {
                            if(thememode == "dark"){
                              thememode = "light";
                            }
                            else{
                              thememode = "dark";
                            }

                          });
                        },

                          child:
                          thememode == "dark" ?

                          Icon(
                             Icons.dark_mode

                              ,color: Colors.white):
                    Icon(
                    Icons.light_mode_rounded

                    ,color: Colors.black))

                      ,
                    )],
                    bottom: TabBar(

                        onTap: (value) => null,
                        padding: EdgeInsets.all(12),
                        indicatorColor: Color(Appcolor.whitecolor).withOpacity(0),

                        labelColor: Color(Appcolor.maincolor),
                        unselectedLabelColor:
                        thememode == "dark" ?
                        Color(Appcolor.whitecolor).withOpacity(0.76):
                        Colors.black
                        ,
                        // unselectedLabelColor: Theme.of(context).indicatorColor,
                        // unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
                        // unselectedLabelColor: Color(Appcolor.whitecolor).withOpacity(0.6),


                        tabs:
                        [
                          Tab(
                            child: Text("Movies"),
                          ),

                          Tab(
                            child: Text("Favorite"),
                          ),
                          Tab(
                            child: InkWell(
                                // onTap: () {
                                //   Navigator.push(
                                //       context, MaterialPageRoute(builder: (context) {
                                //     return SearchScreenHere();
                                //   },));
                                // },
                                child: Text("Search")),
                          ),

                          InkWell(

                              // onTap: () {
                              //   Navigator.push(
                              //       context, MaterialPageRoute(builder: (context) {
                              //     return SearchScreenHere();
                              //   },));
                              // },
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
              ),
              // initialRoute: '/home',
              // routes: {
              //   '/home': (context) => HomePage()
              // },

              // home: Moviepage(),
            );


          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final PostBloc bloc = PostBloc();

  @override
  void initState() {
    // TODO: implement initState
    bloc.add(GetPostList());
    super.initState();
  }

  Widget build(BuildContext context) {
    BlocProvider.of<PostBloc>(context).add(GetPostList());
    print('state');
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme
            .of(context).primaryColor,

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        elevation: 0,


        actions: [
          Icon(Icons.dark_mode_rounded,color: Colors.white,)
        ],
      ),
      body: BlocProvider(create: (context) => bloc,

        child: BlocConsumer<PostBloc, PostState>(

          builder: (context, state) {
            if (state is Postdone) {
              return ListView.builder(

                itemCount: state.post.length,
                itemBuilder: (context, index) {
                  var user = state.post[index];

                  return ListTile(
                    title: Text(user!.title!),
                  );
                },


              );
            }

            if (state is PostError) {
              return Text("Error has been occur");
            }
            return Center(child: CircularProgressIndicator());
          },
          listener: (context, state) {

          },

        ),

      ),

    );
  }
}
