import 'package:geolocator/geolocator.dart';

class Location {
  /// The latitude of this position in degrees normalized to the interval -90.0 to +90.0 (both inclusive).
  double _latitude;

  /// The longitude of the position in degrees normalized to the interval -180 (exclusive) to +180 (inclusive).
  double _longitude;

  Future<Position> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      this._latitude = position.latitude;
      this._longitude = position.longitude;

      return position;
    } catch (e) {
      print('ERROR');
      print(e);
      return null;
    }
  }
}
