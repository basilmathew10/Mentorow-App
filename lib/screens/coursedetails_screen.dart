import 'package:flutter/material.dart';
import 'package:mentorow_app/models/course_model.dart';
import 'package:mentorow_app/screens/aboutscreen.dart';
import 'package:mentorow_app/screens/chapterscreen.dart';
import 'package:mentorow_app/services/webservice.dart';
import 'package:mentorow_app/widgets/customicon.dart';
import 'package:mentorow_app/widgets/customvideoplayer.dart';
import 'package:video_player/video_player.dart';

class CourseDetailScreen extends StatefulWidget {
  final String courseId;

  const CourseDetailScreen({super.key, required this.courseId});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late TabController _tabController;
  CourseModel? courseDetails;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
    _initializeVideoPlayerFuture = _controller.initialize();
    _initializeCourseDetails();
  }

  
  Future<void> _initializeCourseDetails() async {
    try {
      final details = await Webservice().fetchCourseDetails(widget.courseId);
      setState(() {
        courseDetails = details;
      });
    } catch (e) {
      print('Error fetching course details: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
                child: SizedBox(
              width: double.maxFinite,
              height: 280,
              child: FutureBuilder(
                future: Future.wait([
                  _initializeVideoPlayerFuture,
    Webservice().fetchCourseDetails(widget.courseId),
                ]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {

                    return const CustomVideoPlayer();
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )),
            Positioned(
              top: 10,
              left: 20,
              right: 20,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: customIcon(Icons.arrow_back)),
                    GestureDetector(
                        onTap: () {
                          //bookmark function
                        },
                        child: customIcon(Icons.bookmark_border))
                  ]),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: MediaQuery.of(context).size.height * 0.28,
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.grey.shade200,
                ),
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(  
                          courseDetails?.courseName ?? 'Course Name not available',
                          style: const TextStyle(
                        
                              fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         Row(children: [
                          const Icon(
                            Icons.play_circle_fill_rounded,
                            size: 25,
                            color: Colors.pink,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text.rich(
                            TextSpan(
                                text: '20',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.pink),
                                children: [
                                  const TextSpan(text: '\tChapters'),
                                  const WidgetSpan(
                                      child: SizedBox(
                                    width: 20,
                                  )),
                                  const WidgetSpan(
                                      child: Icon(
                                    Icons.timer_sharp,
                                    size: 25,
                                    color: Colors.pink,
                                  )),
                                  TextSpan(text: '\t${courseDetails?.duration}'),
                                  const WidgetSpan(
                                      child: SizedBox(
                                    width: 20,
                                  )),
                                  const WidgetSpan(
                                      child: Icon(
                                    Icons.workspace_premium_sharp,
                                    size: 25,
                                    color: Colors.pink,
                                  )),
                                  const TextSpan(text: '\tCertificate')
                                ]),
                          ),
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.all(8),
                          child: TabBar(
                              unselectedLabelColor: Colors.black,
                              labelColor: Colors.blue.shade800,
                              labelStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1),
                              controller: _tabController,
                              indicatorColor: Colors.blue.shade800,
                              indicatorWeight: 4,
                              indicator: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.pink.withOpacity(0.13)),
                              tabs: const [
                                Tab(
                                  text: 'About',
                                ),
                                Tab(
                                  text: 'Chapters',
                                )
                              ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: TabBarView(
                                controller: _tabController,
                                children:  [
                              AboutScreen(courseDetails: courseDetails),
                              const ChapterScreen()
                            ])),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green.withOpacity(0.2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text.rich(
                                TextSpan(
                                  text: 'Course Fee\n',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  children: [
                                    const WidgetSpan(
                                      child: SizedBox(
                                        height: 30,
                                      ),
                                    ),
                                    const WidgetSpan(
                                      child: Icon(
                                        Icons.currency_rupee_rounded,
                                        size: 25,
                                        color: Colors.pink,
                                      ),
                                    ),
                                    TextSpan(
                                      text: (courseDetails?.price ?? 0).toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.pink,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.1,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Add your onPressed logic here
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 35, vertical: 16),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blue.shade800),
                                ),
                                child: const Text(
                                  'Enroll Now',
                                  style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 1,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

