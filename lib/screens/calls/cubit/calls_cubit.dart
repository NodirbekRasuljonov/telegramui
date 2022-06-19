import 'package:bloc/bloc.dart';
import 'package:telegramui/screens/calls/state/calls_state.dart';

class CallsCubit extends Cubit<CallsState>{
  CallsCubit():super(CallsInitialState(),);
}