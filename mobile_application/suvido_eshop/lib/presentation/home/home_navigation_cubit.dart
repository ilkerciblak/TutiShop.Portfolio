import 'package:bloc/bloc.dart';

class HomeNavigationCubit extends Cubit<int> {
  HomeNavigationCubit() : super(0);

  void onNavTap(int index) {
    emit(index);
  }
}
