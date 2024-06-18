import 'package:flutter/material.dart';
import 'package:mentorow_app/screens/coursedetails_screen.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAv-zeE4wXJYB3yGaggZvItBLC9hzfKlfE2pogyD7llgcpTBaoX03Ksio4hgpKBQ2LvYY&usqp=CAU",
    "https://www.freecodecamp.org/news/content/images/2022/02/Banner-10.png",
    "https://intellipaat.com/course-image/2021/02/NET-Programming-Course-BIG.jpg",
    "https://coderstrustbd.com/wp-content/uploads/2023/08/UI-UX.jpg",
    "https://qph.cf2.quoracdn.net/main-qimg-d708fedcf9c76ae29b240f3cbadf3b40",
    "https://media.licdn.com/dms/image/C4E12AQFM-B0Ts53WGg/article-cover_image-shrink_720_1280/0/1594821930200?e=2147483647&v=beta&t=qV4fjphunZKRzXexdrmYP7uhzS7LB_jz3sETPFOEj-0"
  ];
  List<String> courseNames = [
    'Flutter Development',
    'Python Full Stack',
    '.Net Programming',
    'UI/UX Designing',
    'Data Science',
    'Digital Marketing',
  ];

  String getCourseName(int index) {
    if (index >= 0 && index < courseNames.length) {
      return courseNames[index];
    }
    return "Unknown Course";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.black,
          titleTextStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
          title: const Text("Home"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: StaggeredGridView.countBuilder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: images.length,
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: const Color.fromARGB(255, 205, 218, 238),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: images[index],
                          fit: BoxFit.cover),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CourseDetailScreen(
                            courseId: '65d062d5cfb18ec809652bb2',
                          ),
                        ));
                  },
                );
              },
              staggeredTileBuilder: (context) => const StaggeredTile.fit(1)),
        ));
  }
}
