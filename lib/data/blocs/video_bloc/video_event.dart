part of 'video_bloc.dart';

sealed class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class VideoLoadedEvent extends VideoEvent {
  final String videoUrl;
  final String videoName;
  final int selectedIndex;
  const VideoLoadedEvent(this.videoUrl, this.videoName, this.selectedIndex);

  @override
  List<Object> get props => [videoUrl,videoName, selectedIndex];
}
