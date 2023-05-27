import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather24/api/fetch_weather.dart';
import 'package:weather24/model/weather_data.dart';

class GlobalControler extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

// instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;
  WeatherData getData(){

    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //return if sevice is not enable
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    //  status of permission

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      //  request permission
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    //  getting the current possition

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      //  update lattitude and longitude

      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;

      // calling our weather api
      return FetchWeatherAPI().processData(value.latitude, value.longitude).then((value) {

        weatherData.value = value;
        _isLoading.value = false;

      });




    });
  }
}