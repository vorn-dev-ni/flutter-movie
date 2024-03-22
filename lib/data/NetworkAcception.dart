class AppException implements Exception{

  String? message;

  AppException(this.message);


  @override
  String toString() {
    // TODO: implement toString
    return this.message.toString();
  }
}


class FetchbadNetworkException extends AppException{

  String? message;


  FetchbadNetworkException(this.message):super(message);

}

class ServerBadrequestNetwork  extends AppException{
  String? message;


  ServerBadrequestNetwork(this.message):super(message);


}


class NoInternetConnection  extends AppException{
  String? message;


  NoInternetConnection (this.message):super(message);


}