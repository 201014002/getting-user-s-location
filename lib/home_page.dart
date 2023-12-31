import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  getCurrentLocation()async{
    LocationPermission permission=await Geolocator.checkPermission();
    if(permission==LocationPermission.denied || permission==LocationPermission.deniedForever)
     {print('Location denied');
    LocationPermission ask=await Geolocator.requestPermission();}
    else{
      Position currentPosition=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      print('Latitude=${currentPosition.latitude.toString()}');
      print('/n Longitude=${currentPosition.longitude.toString()}');

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocator'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getCurrentLocation();
          },
          child: Text('Grab Location'),
        ),
      ),
    );
  }
}
