import 'package:bytebank/components/localization/i18n_messages.dart';

class DashboardViewLazyI18N {
  final I18NMessages messages;
  DashboardViewLazyI18N(this.messages);

  String get transfer => messages.get("transfer");

  String get transactionFeed => messages.get("transaction_feed");

  String get changeName => messages.get("change_name");
}
