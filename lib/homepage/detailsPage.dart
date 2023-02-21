import 'package:flutter/material.dart';

import 'detailsmodel.dart';
import 'detels.dart';
class DetailsPage extends StatefulWidget {
 final int id;
  const DetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool loder=true;

  DetailsRepository data= DetailsRepository();

  DetailsEventModelsdata? eventModelsdata;

 Future loadDetails()async{
   eventModelsdata=await data.getDetailseventData(widget.id);
   loder=false;
  setState(() {

  });
  print(eventModelsdata!.status.toString());
  }
  @override
  void initState() {
   loadDetails();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loder? Center(child: CircularProgressIndicator(),):Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(eventModelsdata!.description??"")),
          Center(child: Text(eventModelsdata!.title??""))
        ],

      ),
    );
  }
}
