import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async
  {
    WorldTime instance = WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location.toString(),
      'flag': instance.flag.toString(),
      'time': instance.time.toString(),
      'isDaytime': instance.isDaytime,
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900] ,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
