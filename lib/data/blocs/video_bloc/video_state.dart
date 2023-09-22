part of 'video_bloc.dart';

sealed class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

final class VideoInitial extends VideoState {}

class VideoLoadedState extends VideoState {
  final Future<void>? initializeVideoPlayerFuture;
  final Widget playerWidget;
  const VideoLoadedState(this.initializeVideoPlayerFuture, this.playerWidget);

  @override
  List<Object> get props => [playerWidget];
}

class VideoErrorState extends VideoState {
  final String error;
  const VideoErrorState(this.error);

  @override
  List<Object> get props => [error];
}
