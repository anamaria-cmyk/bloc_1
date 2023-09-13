import 'package:bloc/bloc.dart';
import 'package:bloc_1/enties/casa.dart';
import './fake_casas.dart' as fake_data;
part 'casas_event.dart';
part 'casas_state.dart';

class CasasBloc extends Bloc<CasasEvent, CasasState> {
  CasasBloc() : super(CasasState(
    casas: fake_data.casas
  )) {
    on<CasasEvent>((event, emit) {
      if(event is ChangeHouseState){
        final updatedHouses = List<Casa>.from(state.casas);
        final initHouse = updatedHouses[event.index];
        updatedHouses[event.index] = Casa(
          direccion: initHouse.direccion,
          valor: initHouse.valor,
          disponible: event.isActive,
          url: initHouse.url
        );
        emit(CasasState(
          casas: updatedHouses
        ));
      }
    });
  }
}
