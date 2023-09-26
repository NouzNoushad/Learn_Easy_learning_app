part of 'download_bloc.dart';

sealed class DownloadEvent extends Equatable {
  const DownloadEvent();

  @override
  List<Object> get props => [];
}

class DownloadLoadedEvent extends DownloadEvent {
  final String videoLink;
  final String videoName;
  const DownloadLoadedEvent(this.videoLink, this.videoName);

  @override
  List<Object> get props => [videoLink, videoName];
}
