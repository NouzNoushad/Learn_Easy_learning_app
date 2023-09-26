part of 'download_bloc.dart';

sealed class DownloadState extends Equatable {
  const DownloadState();

  @override
  List<Object> get props => [];
}

final class DownloadInitial extends DownloadState {}

class DownloadLoadedState extends DownloadState {
  final DownloadStatus downloadStatus;
  const DownloadLoadedState(this.downloadStatus);

  @override
  List<Object> get props => [downloadStatus];
}

class DownloadErrorState extends DownloadState {
  final String error;
  const DownloadErrorState(this.error);

  @override
  List<Object> get props => [error];
}
