
import 'calender_model.dart';
import 'package:http/http.dart'as http;

class Repository{


  Future<Modelsdata?> getcalender()async{

    var responce=await http.get(Uri.parse("http://royalinkprojects.com/homeinone_staging/api/v2/calendar_booking_dates?user_id=1&usertype=user"),
        headers: {
      "token":"FhYUjopSG9tZWluT25lOklIaFFLODQ1dS0zYW9SV295NzNRcEVVMW1OQ0xTYkhSfTe"
        });
    print(responce.body);
    if(responce.statusCode==200){
      return modelsdataFromJson(responce.body);
    }


  }
}