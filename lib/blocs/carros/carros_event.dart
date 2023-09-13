part of 'carros_bloc.dart';

sealed class CarrosEvent {}

class ChangeCarColor extends CarrosEvent{
  final Color color;
  final int index;
  ChangeCarColor(this.color, this.index);
}