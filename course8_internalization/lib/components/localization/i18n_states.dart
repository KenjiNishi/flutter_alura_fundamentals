import 'package:bytebank/components/localization/i18n_messages.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class I18NMessagesState {
  const I18NMessagesState();
}

@immutable
class LoadingI18NMessagesState extends I18NMessagesState {
  const LoadingI18NMessagesState();
}

@immutable
class InitI18NMessagesState extends I18NMessagesState {
  const InitI18NMessagesState();
}

@immutable
class LoadedI18NMessagesState extends I18NMessagesState {
  final I18NMessages messages;
  const LoadedI18NMessagesState(this.messages);
}

@immutable
class FatalErrorFormState extends I18NMessagesState {
  final String _message;

  const FatalErrorFormState(this._message);
}
