import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning_app/data/blocs/download_bloc/download_bloc.dart';
import 'package:learning_app/utils/colors.dart';
import 'package:learning_app/utils/constant.dart';

class ModuleInfo extends StatelessWidget {
  final Map chapter;
  final int selectedIndex;
  const ModuleInfo(
      {super.key, required this.chapter, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.14,
      // color: Colors.yellow,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chapter['chapterName'],
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${chapter['chapterNo']} Chapters | ${chapter['hours']} hours',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Mentor: ${chapter['tutor']}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ]),
          ),
          BlocConsumer<DownloadBloc, DownloadState>(
            listener: (context, state) {
              if (state is DownloadLoadedState) {
                if (state.downloadStatus == DownloadStatus.success) {
                  Fluttertoast.showToast(msg: 'Video downloaded successfully');
                }
                if (state.downloadStatus == DownloadStatus.failed) {
                  Fluttertoast.showToast(msg: 'Video download failed');
                }
              }
            },
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    var video = chapter['videos'][selectedIndex];
                    context.read<DownloadBloc>().add(DownloadLoadedEvent(
                        video['videoLink'], video['videoName']));
                  },
                  icon: const Icon(
                    Icons.download,
                    color: ColorPicker.primaryColor,
                  ));
            },
          )
        ],
      ),
    );
  }
}
