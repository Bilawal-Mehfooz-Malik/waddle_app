import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DaySelected { today, weekly, montly }

class DayToggleController extends Notifier<DaySelected> {
  @override
  DaySelected build() {
    return DaySelected.today;
  }

  void onChanged(DaySelected? value) {
    if (value != null) {
      state = value;
    }
  }
}

final dayToggleProvider =
    NotifierProvider<DayToggleController, DaySelected>(DayToggleController.new);
