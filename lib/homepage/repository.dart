import 'package:http/http.dart'as http;

import 'calendermodel.dart';
class Repository{

  Future<List<EventModelsdata>?> geteventData()async{

    var response=await http.post(Uri.parse("https://soclose.co/api/event-list"),
      body: {
      "token" : "YkarKesD3kT4wn8X2MLWb754tzDS1muFstngo8UhyI3hHJTP4Ggn9WXAC4uK3lxOQjZu2z84fvq5qtDp"
      });
    if(response.statusCode==200){
      return eventModelsdataFromJson(response.body);
    }


  }
}