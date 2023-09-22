part of 'video_bloc.dart';

sealed class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class VideoLoadedEvent extends VideoEvent {
  final String videoUrl;
  const VideoLoadedEvent(this.videoUrl);

  @override
  List<Object> get props => [videoUrl];
}
