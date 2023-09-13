// ignore_for_file: must_be_immutable

import 'package:bloc_1/blocs/casas/casas_bloc.dart';
import 'package:bloc_1/enties/casa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 class TarjetaCasa extends StatelessWidget {
  final int index;
  Casa casa;
  TarjetaCasa({
    super.key,
    required this.index,
    required this.casa
  });

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Card(
        child: Column(
          children:[
            Image.network(
              casa.url,
              height: 200,
              width: 200,
              fit: BoxFit.fill,
            ),
            const Spacer(
              flex: 1,
            ),
            Text(casa.direccion),
            const Spacer(
              flex: 1,
            ),
            Text(casa.valor),
            const Spacer(
              flex: 1,
            ),
            SizedBox(
              width: 200,
              child: SwitchListTile(
                activeColor: Colors.black,
                title: const Text('Disponible', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),  ),
                value: casa.disponible,
                onChanged: (value) {
                  BlocProvider.of<CasasBloc>(context).add(ChangeHouseState(value, index));
                }
              ),
            )
          ],
        ) 
      ),
    );
  }
}