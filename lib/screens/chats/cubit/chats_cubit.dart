import 'package:bloc/bloc.dart';
import 'package:telegramui/screens/chats/state/chats_state.dart';

class ChatsCubit extends Cubit<ChatsState>{
  ChatsCubit():super(ChatsInitialState(),);


}