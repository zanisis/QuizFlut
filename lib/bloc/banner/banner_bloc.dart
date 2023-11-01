import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edproject/dataSource/baner_datasource.dart';
import 'package:edproject/model/banner_model.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final bannerDataSource = BannerDataSource();

  BannerBloc() : super(BannerInitial()) {
    on<BannerGetEvent>((event, emit) async {
      emit(BannerLoading());

      final bannerResponse = await bannerDataSource.getBanner();
      log("response: ${bannerResponse.toJson()}");

      emit(BannerSuccess(bannerResponse: bannerResponse));
    });
  }
}
