import 'package:bloc/bloc.dart';
import 'package:bloc_1/enties/carro.dart';
import 'package:flutter/material.dart';
import './fake_carros.dart' as fake_data;

part 'carros_event.dart';
part 'carros_state.dart';

class CarrosBloc extends Bloc<CarrosEvent, CarrosState> {
  CarrosBloc() : super(CarrosState(
    carros: fake_data.carros
  )) {
    on<CarrosEvent>((event, emit) {
      if(event is ChangeCarColor){
        final updatedCars = List<Carro>.from(state.carros);
        final initCar = updatedCars[event.index];
        updatedCars[event.index] = Carro(
          nombre: initCar.nombre,
          url: initCar.url,
          color: event.color
        );
        emit(CarrosState(
          carros: updatedCars
        ));
      }
    });
  }
}
