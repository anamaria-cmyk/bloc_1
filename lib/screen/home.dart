import 'package:bloc_1/blocs/carros/carros_bloc.dart';
import 'package:bloc_1/widgets/tarjeta_carro.dart';
import 'package:bloc_1/widgets/tarjeta_casa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/casas/casas_bloc.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return MultiBlocProvider(
      providers: [
        BlocProvider<CasasBloc>(create: (context) => CasasBloc()),
        BlocProvider<CarrosBloc>(create: (context) => CarrosBloc())
      ],
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.40,
                child: BlocBuilder<CasasBloc, CasasState>(
                  builder: (context, state) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.casas.length,
                      itemBuilder: (_, index) => TarjetaCasa(casa: state.casas[index], index: index),
                    );
                  },
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              SizedBox(
                height: screenHeight * 0.55,
                width: screenWidth * 0.97,
                child: BlocBuilder<CarrosBloc, CarrosState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.carros.length,
                      itemBuilder:  (_, index) => TarjetaCarro(carro: state.carros[index], index: index),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
