import 'package:bloc/bloc.dart';
import 'package:telegramui/screens/home/state/main_home_state.dart';

class MainHomeCubit extends Cubit<MainHomeState>{
  MainHomeCubit():super(MainHomeChatsState(),);
  int currentindex=2;

   void changetheIndex({required int index}) {
    if (index == 0) {
      currentindex = index;
      emit(
        MainHomeContactsState(),
      );
    } else if (index == 1) {
      currentindex = index;
      emit(
        MainHomeCallsState(),
      );
    } else if (index == 2) {
      currentindex = index;
      emit(
        MainHomeChatsState(),
      );
    } else if (index == 3) {
      currentindex = index;
      emit(
        MainHomeSettingsState(),
      );
    }
  }
}