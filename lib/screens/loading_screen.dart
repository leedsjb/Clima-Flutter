import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    const apiKey = String.fromEnvironment('API_KEY');
    Position position = await Location().getCurrentLocation();

    double lat = position.latitude;
    double lon = position.longitude;

    String requestURL =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';

    NetworkHelper networkHelper = NetworkHelper(requestURL);

    var weatherData = await networkHelper.makeRequest();

    // var lon = jsonDecode(data)['coord']['lon'];
    // var weatherDesc = jsonDecode(data)['weather'][0]['description'];
    double temp = weatherData['main']['temp'];
    int condition = weatherData['weather'][0]['id'];
    String cityName = weatherData['name'];

    print(
        'the temp in $cityName is $temp and the condition code is $condition');
  }

  @override
  void initState() {
    super.initState();
    print('init state callback called');
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    print('build method called');
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // getLocation();
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
