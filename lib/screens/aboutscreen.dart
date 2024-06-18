import 'package:flutter/material.dart';
import 'package:mentorow_app/models/course_model.dart';
import 'package:mentorow_app/screens/mentordetails.dart';
import 'package:mentorow_app/widgets/heading.dart';
import 'package:readmore/readmore.dart';

class AboutScreen extends StatefulWidget {
  final CourseModel? courseDetails;
  const AboutScreen({super.key, this.courseDetails});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textHeading('About Course'),
            const SizedBox(
              height: 10,
            ),
            ReadMoreText(
              widget.courseDetails?.description ?? 'No description available',
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
              height: 15,
            ),
            textHeading('About Mentor'),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              height: MediaQuery.of(context).size.height*0.12,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/02/45/56/35/360_F_245563558_XH9Pe5LJI2kr7VQuzQKAjAbz9PAyejG1.jpg'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                   Text.rich(TextSpan(
                    text: 'Mentor Name\n',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Flutter Tutor',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                      const WidgetSpan(child: 
                      SizedBox(
                        width: 50,
                      )),
                      WidgetSpan(child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  const MentorDetailScreen(),));
                        },
                        child: const Text('View Profile',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.pink,
                          letterSpacing: 0.5,
                        ),
                        )
                      ))
                    ]
                  )),
                  
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
           textHeading( 'Benefit of taking this course?'),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: [
                benefitCard(Icons.star_border,'Mentor'),
                benefitCard(Icons.workspace_premium_rounded, 'Certifications'),
                benefitCard(Icons.group_rounded, 'Students Community'),
                benefitCard(Icons.live_tv_rounded,  'Live Session '),
          
          ],
        ),
          ]
        )
      )
    );
  }
}

Widget benefitCard(IconData icon,  String title) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
           Icon(
            icon,
            color: Colors.pink,
            size: 60,
          ),
        
        const SizedBox(
          height: 8,
        ),

          Text(
            title,
            textAlign: TextAlign.center,
            style:  TextStyle(
              color: Colors.blue.shade800,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              
              
            ),
          ),
        
      ],
    
  );
}
