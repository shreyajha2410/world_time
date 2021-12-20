import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
 String time='loading';
   void setupWorldTime()async {
     WorldTime ob=WorldTime(location: 'Berlin', flag:'germany.png', url:'Europe/Berlin');
     await ob.getTime();
     print(ob.time);
     setState(() {
       time=ob.time;
     });
   }
  void initstate(){
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.all(50.0),
        child:Text(time),
      ) ,
    );
  }
}
