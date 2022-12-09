part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<Imagemodel> images;
  final bool hasReachedMax;
  final int page;
  final bool loading;

  HomeState({
    this.images = const <Imagemodel>[],
    this.hasReachedMax = false,
    this.page = 0,
    this.loading = false,
  });

  HomeState copyWith({
    List<Imagemodel>? images,
    bool? hasReachedMax,
    int? page,
    bool? loading,
  }) {
    return HomeState(
      images: images ?? this.images,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object> get props => [images, hasReachedMax, page, loading];
}

class HomeStateLoading extends HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateError extends HomeState {}
