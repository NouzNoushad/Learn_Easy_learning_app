import 'dart:async';

import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/utils/extension.dart';

import '../../utils/constant.dart';

class DownloadRepository {
  ButtonState buttonState = ButtonState.download;
  TaskStatus? downloadTaskStatus;
  DownloadTask? backgroundDownloadTask;
  DownloadStatus? downloadStatus;

  Future<DownloadStatus?> processButtonPress(
      String videoLink, String videoName) async {
    switch (buttonState) {
      case ButtonState.download:
        // start download
        backgroundDownloadTask = DownloadTask(
          url: videoLink,
          filename: 'video_${videoName.changeVideoName}.mp4',
          directory: 'my/directory',
          baseDirectory: BaseDirectory.applicationDocuments,
          updates: Updates.statusAndProgress,
          allowPause: true,
        );
        bool isDownloaded =
            await FileDownloader().enqueue(backgroundDownloadTask!);
        if (isDownloaded) {
          downloadStatus = DownloadStatus.success;
        } else {
          downloadStatus = DownloadStatus.failed;
        }
        //notifyListeners();
        break;
      case ButtonState.cancel:
        // cancel download
        if (backgroundDownloadTask != null) {
          await FileDownloader()
              .cancelTasksWithIds([backgroundDownloadTask!.taskId]);
        }
        downloadStatus = DownloadStatus.cancel;
        break;
      case ButtonState.reset:
        downloadTaskStatus = null;
        buttonState = ButtonState.download;
        downloadStatus = DownloadStatus.reset;
        break;
      case ButtonState.pause:
        if (backgroundDownloadTask != null) {
          await FileDownloader().pause(backgroundDownloadTask!);
        }
        downloadStatus = DownloadStatus.pause;
        break;
      case ButtonState.resume:
        if (backgroundDownloadTask != null) {
          await FileDownloader().resume(backgroundDownloadTask!);
        }
        downloadStatus = DownloadStatus.resume;
        break;
    }
    String filePath = await backgroundDownloadTask!.filePath();
    debugPrint('////////////////////// filePath: $filePath');
    return downloadStatus;
  }
}
