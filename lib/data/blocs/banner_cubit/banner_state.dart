part of 'banner_cubit.dart';

sealed class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

final class BannerInitial extends BannerState {}

final class BannerChangedState extends BannerState {
  final int current;
  final CarouselController controller;
  const BannerChangedState(this.current, this.controller);

  @override
  List<Object> get props => [current, controller];
}
