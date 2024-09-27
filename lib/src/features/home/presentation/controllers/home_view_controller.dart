import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waddle_app/src/features/home/presentation/widgets/segmented_section.dart';

class HomeViewController extends Notifier<HomeView> {
  @override
  HomeView build() {
    return HomeView.steps;
  }

  void onChanged(HomeView value) {
    state = value;
  }
}

final homeViewProvider =
    NotifierProvider<HomeViewController, HomeView>(HomeViewController.new);
