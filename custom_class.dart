import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime{

  String location; //location name for UI
  String time=''; //time in that location
  String flag; //url to an asset flag icon for the locations
  String url; //location from url of api

  WorldTime({required this.location, required this.flag,required this.url});

  Future<void> getTime() async{
    //make the request
    String api="http://worldtimeapi.org/api/timezone/$url";
     var response = await http.get(api);
    //print(data);
    var data = jsonDecode(response.body);
    String datetime= data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(datetime);
    //print(offset);

    //create datetime object
    DateTime now = DateTime.parse(datetime);
    now=now.add(Duration(hours: int.parse(offset)));
    time=now.toString(); //set the time property
  }

}
