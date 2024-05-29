import 'package:bloc/bloc.dart';
import 'package:weatherapp/Cubits/weather_cubit/weatherState.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class weatherCubit extends Cubit<weatherState> {
  weatherCubit(this.weatherService) : super(initialState());

  weatherservice weatherService;
  weatherModel? Weathermodel;
  String? CityName;
  void getweather({required CityName}) async {
    emit(loadingDataState());
    try {
      Weathermodel = await weatherService.getweather(CityName: CityName);
      emit(successState(weathermodel: Weathermodel!));
      // ignore: unused_catch_clause
    } catch (e) {
      emit(failureState());
    }
  }
}
