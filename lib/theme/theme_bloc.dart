import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../res/appcolor.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
 ThemeData data =  ThemeData(
    fontFamily: 'Poppin',
    primaryColor: Color(Appcolor.maincolor),
    iconTheme: IconThemeData(color: Color(Appcolor.maincolor)),

    textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w500, color: Colors.white),
        titleLarge: TextStyle(fontSize: 18,
          overflow: TextOverflow.ellipsis,


          fontWeight: FontWeight.w500,

          color: Color(Appcolor.whitecolor),

        ),
        displayMedium: TextStyle(fontSize: 13,
            color: Colors.white.withOpacity(0.50),
            fontWeight: FontWeight.w400,
            height: 1.36

        ),
        bodyMedium: TextStyle(
            fontSize: 15, color: Colors.white.withOpacity(0.5)),
        titleMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600,
            color: Color(Appcolor.whitecolor)),
        titleSmall: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400,
            color: Color(Appcolor.whitecolor)),
        displaySmall: TextStyle(fontSize: 10, color: Colors.black),
        labelMedium: TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.w600
        ),
        bodySmall: TextStyle(
            fontSize: 14, color: Colors.grey
        ),
        labelSmall: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Color(Appcolor.maincolor)
        ),
        labelLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black
        )


    ),
    scaffoldBackgroundColor: Color(Appcolor.bgcolor),

  );

  ThemeBloc() : super(ThemeState(
      data:
      ThemeData(
    fontFamily: 'Poppin',
    indicatorColor: Color(Appcolor.whitecolor),
    primaryColor: Color(Appcolor.maincolor),
    iconTheme: IconThemeData(color: Color(Appcolor.whitecolor)),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(Appcolor.bgcolor)
    ),
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: Color(Appcolor.whitecolor),
          cursorColor: Color(Appcolor.maincolor)
        ),


    textTheme: TextTheme(
       bodyLarge:
       TextStyle(
           color: Colors.white.withOpacity(0.5),
           fontWeight: FontWeight.w400,


       ),

        displayLarge: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w500, color: Colors.white),


        titleLarge: TextStyle(fontSize: 18,
          overflow: TextOverflow.ellipsis,


          fontWeight: FontWeight.w500,

          color: Color(Appcolor.whitecolor),

        ),

        displayMedium: TextStyle(fontSize: 13,
            color: Colors.white.withOpacity(0.50),
            fontWeight: FontWeight.w400,
            height: 1.36

        ),
        bodyMedium: TextStyle(
            fontSize: 15, color: Colors.white.withOpacity(0.5)),
        titleMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600,
            color: Color(Appcolor.whitecolor)),
        titleSmall: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400,
            color: Color(Appcolor.whitecolor)),
        displaySmall: TextStyle(fontSize: 10, color: Colors.black),
        labelMedium: TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.w600
        ),
        bodySmall: TextStyle(
            fontSize: 14, color: Colors.grey
        ),
        headlineMedium: TextStyle(
            fontSize: 4, color: Colors.grey
        ),

        labelSmall: TextStyle(
            fontSize:13,
            fontWeight: FontWeight.w500,
            // color: Colors.white
            color: Color(Appcolor.maincolor)
        ),

        headlineSmall:TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500
        ),
        labelLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black
        )


    ),
    scaffoldBackgroundColor: Color(Appcolor.bgcolor),

  ) )) {
    on<GetTheme>((event, emit) {
      // TODO: implement event handler
      // emit(ThemeState(data: ThemeData(
      //   fontFamily: 'Poppin',
      //   primaryColor: Color(Appcolor.maincolor),
      //   iconTheme: IconThemeData(color: Color(Appcolor.maincolor)),
      //
      //   textTheme: TextTheme(
      //       displayLarge: TextStyle(fontSize: 18,
      //           fontWeight: FontWeight.w500, color: Colors.white),
      //       titleLarge: TextStyle(fontSize: 18,
      //         overflow: TextOverflow.ellipsis,
      //
      //
      //         fontWeight: FontWeight.w500,
      //
      //         color: Color(Appcolor.whitecolor),
      //
      //       ),
      //       displayMedium: TextStyle(fontSize: 13,
      //           color: Colors.white.withOpacity(0.50),
      //           fontWeight: FontWeight.w400,
      //           height: 1.36
      //
      //       ),
      //       bodyMedium: TextStyle(
      //           fontSize: 15, color: Colors.white.withOpacity(0.5)),
      //       titleMedium: TextStyle(
      //           fontSize: 20, fontWeight: FontWeight.w600,
      //           color: Color(Appcolor.whitecolor)),
      //       titleSmall: TextStyle(
      //           fontSize: 14, fontWeight: FontWeight.w400,
      //           color: Color(Appcolor.whitecolor)),
      //       displaySmall: TextStyle(fontSize: 10, color: Colors.black),
      //       labelMedium: TextStyle(
      //           fontSize: 17,
      //           color: Colors.white,
      //           fontWeight: FontWeight.w600
      //       ),
      //       bodySmall: TextStyle(
      //           fontSize: 14, color: Colors.grey
      //       ),
      //       labelSmall: TextStyle(
      //           fontSize: 11,
      //           fontWeight: FontWeight.w400,
      //           color: Color(Appcolor.maincolor)
      //       ),
      //       labelLarge: TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.w500,
      //           color: Colors.black
      //       )
      //
      //
      //   ),
      //   scaffoldBackgroundColor: Color(Appcolor.bgcolor),
      //
      // )));
    });
    on<SwitchThemeEvent>((event, emit) {
      print(event.mode);
      // TODO: implement event handler
      if(event.mode== "dark"){
        emit(
            ThemeSwitchState(data:  ThemeData(
              fontFamily: 'Poppin',
              primaryColor: Color(Appcolor.whitecolor),
              iconTheme: IconThemeData(color: Color(Appcolor.bgcolor2)),

              textTheme: TextTheme(
                  displayLarge: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w500, color: Colors.white),
                  titleLarge: TextStyle(fontSize: 18,
                    overflow: TextOverflow.ellipsis,


                    fontWeight: FontWeight.w500,

                    color: Color(Appcolor.whitecolor),

                  ),
                  displayMedium: TextStyle(fontSize: 13,
                      color: Colors.white.withOpacity(0.50),
                      fontWeight: FontWeight.w400,
                      height: 1.36

                  ),
                  bodyMedium: TextStyle(
                      fontSize: 15, color: Colors.white.withOpacity(0.5)),
                  titleMedium: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600,
                      color: Color(Appcolor.whitecolor)),
                  titleSmall: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400,
                      color: Color(Appcolor.whitecolor)),
                  displaySmall: TextStyle(fontSize: 10, color: Colors.black),
                  labelMedium: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),
                  bodySmall: TextStyle(
                      fontSize: 14, color: Colors.grey
                  ),
                  labelSmall: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(Appcolor.maincolor)
                  ),
                  labelLarge: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  )


              ),
              scaffoldBackgroundColor: Color(Appcolor.whitecolor),

            )));
      }
      else{
              emit(
                  ThemeState(data:  ThemeData(
                fontFamily: 'Poppin',
                primaryColor: Color(Appcolor.whitecolor),
                iconTheme: IconThemeData(color: Color(Appcolor.maincolor)),

                textTheme: TextTheme(
                    displayLarge: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w500, color: Colors.white),
                    titleLarge: TextStyle(fontSize: 18,
                      overflow: TextOverflow.ellipsis,


                      fontWeight: FontWeight.w500,

                      color: Color(Appcolor.whitecolor),

                    ),
                    displayMedium: TextStyle(fontSize: 13,
                        color: Colors.white.withOpacity(0.50),
                        fontWeight: FontWeight.w400,
                        height: 1.36

                    ),
                    bodyMedium: TextStyle(
                        fontSize: 15, color: Colors.white.withOpacity(0.5)),
                    titleMedium: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600,
                        color: Color(Appcolor.whitecolor)),
                    titleSmall: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400,
                        color: Color(Appcolor.whitecolor)),
                    displaySmall: TextStyle(fontSize: 10, color: Colors.black),
                    labelMedium: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),
                    bodySmall: TextStyle(
                        fontSize: 14, color: Colors.grey
                    ),
                    labelSmall: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(Appcolor.maincolor)
                    ),
                    labelLarge: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    )


                ),
                scaffoldBackgroundColor: Color(Appcolor.whitecolor),

              )));
      }
    });
  }
}
