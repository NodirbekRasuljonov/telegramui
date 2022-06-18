import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:telegramui/screens/auth/state/auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super(AuthInitialState(),);


  TextEditingController phonenumbercontroller=TextEditingController();
  String country='Usa';
  String value='+1';
  bool sync=false;


  void changePhone({required v,}){
    v=value;
    emit(AuthInitialState(),);
  }

  void changesync({required v}){
    sync=v;
    emit(AuthInitialState(),);
  }


  void phonecheck({required BuildContext context}){
    Navigator.pushNamed(context, '/chats');
  }
}