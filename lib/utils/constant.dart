import 'package:learning_app/utils/extension.dart';

enum SignUpStatus { successful, failed, pending, exists }

enum LoginStatus { pending, successful, exists, noUser, wrongPassword, failed }

enum ButtonState { download, cancel, pause, resume, reset }

enum DownloadStatus { success, failed, cancel, pause, resume, reset }

const String dbName = 'courses';
const String usersDbName = 'users';

downloadFilePath(String fileName) {
  return '/data/user/0/com.example.learning_app/app_flutter/my/directory/video_${fileName.changeVideoName}.mp4';
}
