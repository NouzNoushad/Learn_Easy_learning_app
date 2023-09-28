import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/data/repositories/video_player.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoPlayerRepository videoPlayerRepository;
  VideoBloc({
    required this.videoPlayerRepository,
  }) : super(VideoInitial()) {
    on<VideoLoadedEvent>(initializePlayer);
  }

  FutureOr<void> initializePlayer(
      VideoLoadedEvent event, Emitter<VideoState> emit) async {
    try {
      await videoPlayerRepository.initPlayer(event.videoUrl, event.videoName);
      emit(VideoLoadedState(
          videoPlayerRepository.initializeVideoPlayerFuture, videoPlayerRepository.playerWidget, event.selectedIndex,  videoPlayerRepository.isFileExists));
    } catch (error) {
      emit(VideoErrorState(error.toString()));
    }
  }
}
