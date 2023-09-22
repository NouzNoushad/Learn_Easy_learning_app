import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:equatable/equatable.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());
  final CarouselController controller = CarouselController();
  int current = 0;

  onPageChanged(int index) {
    current = index;
    emit(BannerChangedState(current, controller));
  }
}
