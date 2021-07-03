import 'package:bytebank/components/localization/i18n_messages.dart';
import 'package:bytebank/components/localization/i18n_states.dart';
import 'package:bytebank/http/webclients/i18n_webclient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';

class I18NMessagesCubit extends Cubit<I18NMessagesState> {
  final String viewKey;
  final LocalStorage storage = new LocalStorage('unsafe_v1.json');
  I18NMessagesCubit(this.viewKey) : super(InitI18NMessagesState());

  void reload(I18NWebClient client) async {
    emit(LoadingI18NMessagesState());
    await storage.ready;
    final items = storage.getItem(viewKey);
    if (items != null) {
      emit(LoadedI18NMessagesState(I18NMessages(items)));
      return;
    }
    client.findAll().then(saveAndRefresh);
  }

  saveAndRefresh(Map<String, dynamic> messages) {
    storage.setItem(viewKey, messages);
    final state = LoadedI18NMessagesState(I18NMessages(messages));
    emit(state);
  }
}
