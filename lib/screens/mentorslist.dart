import 'package:flutter/material.dart';

class MentorsListScreen extends StatelessWidget {
  const MentorsListScreen({required Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const SizedBox(height: 20),
            const Text(
              'Mentors List',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            buildMentorProfile(
              name: 'John Doe',
              imageUrl: 'https://t4.ftcdn.net/jpg/02/45/56/35/360_F_245563558_XH9Pe5LJI2kr7VQuzQKAjAbz9PAyejG1.jpg',
              subtitle: 'Senior Developer',
            ),
            buildMentorProfile(
              name: 'Priya',
              imageUrl: 'https://i.pinimg.com/564x/1e/b9/5a/1eb95a3eaef402828b3e539006afde30.jpg',
              subtitle: 'UI/UX Designer',
            ),
            buildMentorProfile(
              name: 'Arjun',
              imageUrl: 'https://i.pinimg.com/564x/4b/cc/54/4bcc54ebe6d0e6700e3df3047c1129c8.jpg',
              subtitle: 'Mobile App Developer',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMentorProfile({required String name, required String imageUrl, required String subtitle}) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(name),
        subtitle: Text(subtitle),
        onTap: () {
          
        },
      ),
    );
  }
}