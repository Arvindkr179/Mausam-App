import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mausam/data/my_data.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<Fetchweather>((event, emit) async {
      emit(WeatherLoad());
      try {
        WeatherFactory wf = WeatherFactory("311451130c5f7a7dbf1cf676158e0a14",
            language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        print(weather);
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFail());
      }
      // TODO: implement event handler
    });
  }
}
