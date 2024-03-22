import 'dart:io';

import 'package:movie_app_api_bloc/data/NetworkAcception.dart';
import 'package:movie_app_api_bloc/models/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/MovieModel.dart';
class NetworkApiService{

Future<dynamic> fetchUserList () async{


    try{
   var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));


   var res = CheckStateConnection( response );
   final result = json.decode(res);
   return result;

    }on SocketException{
          throw NoInternetConnection("NO internet right now");

    }



}


Future<dynamic> movieNetworkService() async {

  try{
      var res = await http.get(
          Uri.parse(("https://api.themoviedb.org/3/trending/movie/day?language=en-US")),

      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3Y2Q0ZGJiNzE2ZTZjMWQyOGQxY2FjNGFkM2UwZTc0ZCIsInN1YiI6IjYzZjU4NTMxOTkyZmU2MDBkYjVmMDNiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vj83DkaDGx1IxHMB3F1K0ZdLLBU_HofZ9HBnXiGDd0g'
      }
      );


      var response = CheckStateConnection(res);
      // print(response);
   // List result = json.decode(response)['results'];
      var result = json.decode(response);
      // print(result);
   // print(result);
     return result;


  }on SocketException{
    throw NoInternetConnection("No internet");
  }

}
Future<dynamic> movieall() async {

  try{
    var res = await http.get(
        Uri.parse(("https://api.themoviedb.org/3/discover/movie")),

        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3Y2Q0ZGJiNzE2ZTZjMWQyOGQxY2FjNGFkM2UwZTc0ZCIsInN1YiI6IjYzZjU4NTMxOTkyZmU2MDBkYjVmMDNiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vj83DkaDGx1IxHMB3F1K0ZdLLBU_HofZ9HBnXiGDd0g'
        }
    );


    var response = CheckStateConnection(res);
    print(response);
    // List result = json.decode(response)['results'];
    var result = json.decode(response);
    // print(result);
    // print(result);
    return result;


  }on SocketException{
    throw NoInternetConnection("No internet");
  }

}
Future<dynamic> movieNetworkPopularService() async {

  try{
    var res = await http.get(
        Uri.parse(("https://api.themoviedb.org/3/trending/all/day?language=en-US")),

        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3Y2Q0ZGJiNzE2ZTZjMWQyOGQxY2FjNGFkM2UwZTc0ZCIsInN1YiI6IjYzZjU4NTMxOTkyZmU2MDBkYjVmMDNiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vj83DkaDGx1IxHMB3F1K0ZdLLBU_HofZ9HBnXiGDd0g'
        }
    );


    var response = CheckStateConnection(res);
    print(response);
    // List result = json.decode(response)['results'];
    var result = json.decode(response);
    // print(result);
    // print(result);
    return result;


  }on SocketException{
    throw NoInternetConnection("No internet");
  }

}

Future<dynamic> movieNetworkNowPlayingService() async {
  try{
    var res = await http.get(
        Uri.parse(("https://api.themoviedb.org/3/discover/movie?language=en-US&primary_release_date.gte=2023-09-01&primary_release_date.lte=2023-09-10")),

        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3Y2Q0ZGJiNzE2ZTZjMWQyOGQxY2FjNGFkM2UwZTc0ZCIsInN1YiI6IjYzZjU4NTMxOTkyZmU2MDBkYjVmMDNiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vj83DkaDGx1IxHMB3F1K0ZdLLBU_HofZ9HBnXiGDd0g'
        }
    );


    var response = CheckStateConnection(res);
    // print(response);
    // List result = json.decode(response)['results'];
    var result = json.decode(response);
    // print(result);
    // print(result);
    return result;


  }on SocketException{
    throw NoInternetConnection("No internet");
  }
}
Future<dynamic> movieNetworkUpComingService() async {
  try{
    var res = await http.get(
        Uri.parse(("https://api.themoviedb.org/3/discover/movie?language=en-US&primary_release_date.gte=2023-10-10")),

        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3Y2Q0ZGJiNzE2ZTZjMWQyOGQxY2FjNGFkM2UwZTc0ZCIsInN1YiI6IjYzZjU4NTMxOTkyZmU2MDBkYjVmMDNiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vj83DkaDGx1IxHMB3F1K0ZdLLBU_HofZ9HBnXiGDd0g'
        }
    );


    var response = CheckStateConnection(res);
    // print(response);
    // List result = json.decode(response)['results'];
    var result = json.decode(response);
    // print(result);
    // print(result);
    return result;


  }on SocketException{
    throw NoInternetConnection("No internet");
  }
}
Future<dynamic> movieNetworkDetailId(id) async {
  try{
    print(id);
    var res = await http.get(
        Uri.parse(("https://api.themoviedb.org/3/movie/${id}")),

        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3Y2Q0ZGJiNzE2ZTZjMWQyOGQxY2FjNGFkM2UwZTc0ZCIsInN1YiI6IjYzZjU4NTMxOTkyZmU2MDBkYjVmMDNiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vj83DkaDGx1IxHMB3F1K0ZdLLBU_HofZ9HBnXiGDd0g'
        }
    );


    var response = CheckStateConnection(res);
    print(response);
    // List result = json.decode(response)['results'];
    var result = json.decode(response);
    // print(result);
    // print(result);
    return result;


  }on SocketException{
    throw NoInternetConnection("No internet");
  }
}
Future<dynamic> movieNetworkTopRatedService() async {
  try{
    var res = await http.get(
        Uri.parse(("https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200&primary_release_date.gte=2023-06-01")),

        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3Y2Q0ZGJiNzE2ZTZjMWQyOGQxY2FjNGFkM2UwZTc0ZCIsInN1YiI6IjYzZjU4NTMxOTkyZmU2MDBkYjVmMDNiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vj83DkaDGx1IxHMB3F1K0ZdLLBU_HofZ9HBnXiGDd0g'
        }
    );


    var response = CheckStateConnection(res);
    print(response);
    // List result = json.decode(response)['results'];
    var result = json.decode(response);
    // print(result);
    // print(result);
    return result;


  }on SocketException{
    throw NoInternetConnection("No internet");
  }
}
Future<dynamic> moviegenreService() async {
  try{
    String url ="https://api.themoviedb.org/3/genre/movie/list";
    var response = await http.get(Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3Y2Q0ZGJiNzE2ZTZjMWQyOGQxY2FjNGFkM2UwZTc0ZCIsInN1YiI6IjYzZjU4NTMxOTkyZmU2MDBkYjVmMDNiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vj83DkaDGx1IxHMB3F1K0ZdLLBU_HofZ9HBnXiGDd0g'
        }

    );
    // print(response.body);
    return json.decode(CheckStateConnection(response));
  }on SocketException{
    throw NoInternetConnection("No internet connection");
  }
}


Future<dynamic> moviebygidService(id) async {
  try{
    String url ="https://api.themoviedb.org/3/discover/movie?with_genres=$id";
    var response = await http.get(Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3Y2Q0ZGJiNzE2ZTZjMWQyOGQxY2FjNGFkM2UwZTc0ZCIsInN1YiI6IjYzZjU4NTMxOTkyZmU2MDBkYjVmMDNiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vj83DkaDGx1IxHMB3F1K0ZdLLBU_HofZ9HBnXiGDd0g'
        }

    );
    // print(response.body);
    return json.decode(CheckStateConnection(response));
  }on SocketException{
    throw NoInternetConnection("No internet connection");
  }
}
Future<dynamic> movieDetailcastService(var id) async {
  try{
    String url ="https://api.themoviedb.org/3/movie/${id}/credits";
    var response = await http.get(Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3Y2Q0ZGJiNzE2ZTZjMWQyOGQxY2FjNGFkM2UwZTc0ZCIsInN1YiI6IjYzZjU4NTMxOTkyZmU2MDBkYjVmMDNiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vj83DkaDGx1IxHMB3F1K0ZdLLBU_HofZ9HBnXiGDd0g'
        }

    );
    // print(response.body);
  return json.decode(CheckStateConnection(response));
  }on SocketException{
    throw NoInternetConnection("No internet connection");
  }
}
Future<dynamic> movieDetailSearchService(String? title) async {
  try{
    String url ="https://api.themoviedb.org/3/search/movie?query=$title";
    var response = await http.get(Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3Y2Q0ZGJiNzE2ZTZjMWQyOGQxY2FjNGFkM2UwZTc0ZCIsInN1YiI6IjYzZjU4NTMxOTkyZmU2MDBkYjVmMDNiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vj83DkaDGx1IxHMB3F1K0ZdLLBU_HofZ9HBnXiGDd0g'
        }

    );
    // print(response.body);
    return json.decode(CheckStateConnection(response));
  }on SocketException{
    throw NoInternetConnection("No internet connection");
  }
}
 CheckStateConnection(http.Response response) {

    if(response.statusCode == 200){
     return response.body;

    }

    if(response.statusCode == 400) {

      throw ServerBadrequestNetwork("Server is not available");


    }
    else{
      throw FetchbadNetworkException("Something error in client site");
    }



    }

  }


