import 'package:http/http.dart'as http;

import 'calendermodel.dart';
import 'detailsmodel.dart';
class DetailsRepository{

  Future<DetailsEventModelsdata?> getDetailseventData(int id)async{

    var response=await http.post(Uri.parse("https://soclose.co/api/event-details"),
        body: {
          "token" : "YkarKesD3kT4wn8X2MLWb754tzDS1muFstngo8UhyI3hHJTP4Ggn9WXAC4uK3lxOQjZu2z84fvq5qtDp",
          "id":"$id"
        });
    if(response.statusCode==200){

      print(response.body);
      return detailsEventModelsdataFromJson(response.body);

    }


  }
}