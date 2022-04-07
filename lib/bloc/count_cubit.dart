import 'package:flutter_bloc/flutter_bloc.dart';

class CountCubit extends Cubit<int>{
  CountCubit(int initialState) : super(initialState);

  int count = 0;


  void add(){
    count++;
    emit(state);
  }
}