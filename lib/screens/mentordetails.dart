import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorow_app/widgets/custombuttoncard.dart';
import 'package:mentorow_app/widgets/customicon.dart';
import 'package:mentorow_app/widgets/heading.dart';
import 'package:readmore/readmore.dart';
// import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class MentorDetailScreen extends StatefulWidget {
 
  // final Uri _url =
  //     Uri.parse('https://in.linkedin.com/company/mentorow-official');
  const MentorDetailScreen({super.key});

  @override
  State<MentorDetailScreen> createState() => _MentorDetailScreenState();
}

class _MentorDetailScreenState extends State<MentorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                    'https://st2.depositphotos.com/7865540/10804/i/450/depositphotos_108049256-stock-photo-multicolor-doodle-sketch-on-notebook.jpg',
                  ),
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Positioned(
              top: 10,
              left: 20,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: customIcon(Icons.arrow_back)),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: MediaQuery.of(context).size.height * 0.28,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.grey.shade200,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                              'https://t4.ftcdn.net/jpg/02/45/56/35/360_F_245563558_XH9Pe5LJI2kr7VQuzQKAjAbz9PAyejG1.jpg'),
                        ),
                        Text.rich(TextSpan(
                            text: 'Mentor Name',
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w800,
                            ),
                            children: [
                              TextSpan(
                                  text: '\nDesignation',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.green.shade700))
                            ])),
                        const SizedBox(
                          width: 40,
                        ),
                        GestureDetector(
                            onTap: () {
                              // _launchUrl;
                            },
                            child: SvgPicture.asset(
                                'assets/icons/linkedin_logo.svg'))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textHeading('About Myself'),
                    const SizedBox(
                      height: 8,
                    ),
                    ReadMoreText(
                      'Experienced Flutter mentor dedicated to guiding and inspiring aspiring developers. Passionate about sharing expertise in Flutter app development, I create a collaborative learning environment to empower mentees. Committed to staying updated on Flutter advancements, I help mentees grasp core concepts, tackle challenges, and excel in creating cross-platform applications.',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade800,
                          height: 1.35),
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'See More',
                      trimExpandedText: 'See less',
                      moreStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800),
                      lessStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    textHeading('Skills'),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buttonCard('Android Development', context),
                            buttonCard('Flutter', context),
                            buttonCard('UI/UX', context),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buttonCard('State Management', context),
                            buttonCard('API', context),
                            buttonCard('Testing', context),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textHeading('Experience'),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
