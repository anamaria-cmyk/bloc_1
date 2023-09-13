// ignore_for_file: must_be_immutable

import 'package:bloc_1/blocs/carros/carros_bloc.dart';
import 'package:bloc_1/enties/carro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TarjetaCarro extends StatelessWidget {
  final int index;
  Carro carro;
  TarjetaCarro({
    super.key, 
    required this.index,
    required this.carro,
  });
   @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 350,
      child: Card(
        color: carro.color,
        child: Column(
          children:[
            const Spacer(
              flex: 4,
            ),
            Image.network(
              carro.url,
              height: 250,
              width: 320,
              fit: BoxFit.fill,
            ),
            const Spacer(
              flex: 1,
            ),
            Text(carro.nombre),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  elevation: 4,
                  onPressed: () {
                    BlocProvider.of<CarrosBloc>(context).add(ChangeCarColor(const Color.fromARGB(0, 104, 167, 186), index));
                  } ,
                  child: const Icon( Icons.colorize, color: Colors.white),
                ),
              
                MaterialButton(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  elevation: 4,
                  onPressed: () {
                    BlocProvider.of<CarrosBloc>(context).add(ChangeCarColor(const Color.fromARGB(151, 63, 61, 106), index));
                  } ,
                  child: const Icon( Icons.colorize_outlined, color: Colors.white)
                ),
              ],
            ),
          ],
        ) 
      ),
    );
  }
}