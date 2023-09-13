part of 'casas_bloc.dart';

sealed class CasasEvent {}

class ChangeHouseState extends CasasEvent{
  final bool isActive;
  final int index;
  ChangeHouseState(this.isActive, this.index);
}
