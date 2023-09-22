import 'package:flutter/material.dart';
import 'package:learning_app/data/repositories/course_repository.dart';
import 'package:learning_app/presentation/learning_home/modules/banner.dart';
import 'package:learning_app/presentation/learning_home/modules/chapter_content.dart';
import 'package:learning_app/utils/colors.dart';

class LearningHomeScreen extends StatefulWidget {
  const LearningHomeScreen({super.key});

  @override
  State<LearningHomeScreen> createState() => _LearningHomeScreenState();
}

class _LearningHomeScreenState extends State<LearningHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorPicker.primaryColor,
        title: const Text(
          'Learn Easy',
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: StreamBuilder(
          stream: CourseRepository().getCourses(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              Map<String, dynamic> courses = snapshot.data!.docs[0].data();
              List banners = courses['banners'].toList();
              List chapters = courses['chapters'].toList();
              debugPrint('//////////// data: $banners');
              return CustomScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverList(
                        delegate: SliverChildListDelegate.fixed([
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BannerImages(
                              banners: banners,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Suggested courses',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  ...List.generate(chapters.length, (index) {
                                    var chapter = chapters[index];
                                    return ChapterContent(chapter: chapter);
                                  })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ]))
                  ]);
            }
            return Container();
          }),
    );
  }
}
