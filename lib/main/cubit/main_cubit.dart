import 'package:bloc/bloc.dart';
import 'package:telegramui/main/state/main_state.dart';

class MainCubit extends Cubit<MainState>{
  MainCubit():super(MainInitialState(),);

  bool isDark=false;
  

}