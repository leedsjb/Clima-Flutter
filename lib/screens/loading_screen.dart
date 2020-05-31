import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    print('getting location');
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    print(position);
  }

  @override
  void initState() {
    super.initState();
    print('init state callback called');
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    print('build method called');
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }

  void deactivate() {
    super.deactivate();
    print('deactivate callback called');
  }
  // void dispose(){} used when removed from tree PERMANENTLY
}
