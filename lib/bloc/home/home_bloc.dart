import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:search_image/model/imagemodel.dart';
import 'package:search_image/repository/repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeStateInitial()) {
    on<ImageSearching>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        final data = await Repo.fetchApi(event.searchText, 1);
        data.isEmpty
            ? emit(state.copyWith(hasReachedMax: false, loading: false))
            : emit(state.copyWith(
                images: data,
                page: 1,
                loading: false,
              ));
      } catch (e) {
        emit(HomeStateError());
      }
    });

    //for lazy
    on<ImageFetching>((event, emit) async {
      try {
        int page = state.page + 1;
        final data = await Repo.fetchApi(event.searchText, page);
        data.isEmpty
            ? emit(state.copyWith(
                hasReachedMax: false,
                loading: false,
              ))
            : emit(state.copyWith(
                images: state.images + data,
                page: page,
                loading: false,
              ));
      } catch (e) {
        emit(HomeStateError());
      }
    });
  }
}
