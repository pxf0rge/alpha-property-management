import 'package:bloc/bloc.dart';

class FavoriteCubit extends Cubit<Map<int, bool>> {
  FavoriteCubit() : super({});

  bool isFavorite(int index) => state[index] ?? false;

  void toggleFavorite(int index) {
    final newState = Map<int, bool>.from(state);
    newState[index] = !isFavorite(index);
    emit(newState);
  }
}
