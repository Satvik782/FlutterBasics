import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String? location; //Location name for the UI
  String time = ''; //the time in that location
  String? flag; //url to an asset flag icon
  String? url; //location url for API endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async{

    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // print(datetime);
      // print(offset);

      //Create DateTIme object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      //set the time property
      time = DateFormat.jm().format(now);

    }
    catch(e) {
      print('caught error $e');
      time = 'could not get time data';
    }

  }
}


