import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/data/repositories/download_repository.dart';

import '../../../utils/constant.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final DownloadRepository downloadRepository;
  DownloadBloc({
    required this.downloadRepository,
  }) : super(DownloadInitial()) {
    on<DownloadLoadedEvent>(downloadVideo);
  }

  FutureOr<void> downloadVideo(
      DownloadLoadedEvent event, Emitter<DownloadState> emit) async {
    try {
      DownloadStatus? downloadStatus = await downloadRepository.processButtonPress(event.videoLink, event.videoName);
      if(downloadStatus != null){
        emit(DownloadLoadedState(downloadStatus));
      }
    } catch (error) {
      emit(DownloadErrorState(error.toString()));
    }
  }
}
