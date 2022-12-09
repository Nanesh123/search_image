part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ImageRefresh extends HomeEvent {}

class ImageSearching extends HomeEvent {
  final String searchText;

  const ImageSearching(this.searchText);
}

class ImageFetching extends HomeEvent {
  final String searchText;

  const ImageFetching(this.searchText);
}
