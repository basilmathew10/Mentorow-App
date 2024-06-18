import 'package:flutter/material.dart';

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({super.key});

  Widget buildExpansionTile(String sectionTitle, List<String> chapters) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          sectionTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          'Total chapters ${chapters.length}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        children: [
          for (var i = 0; i < chapters.length; i++)
            ListTile(
              title: Text(
                chapters[i],
                style: const TextStyle(fontSize: 16),
              ),
              trailing: Radio<int>(
                value: i,
                groupValue: null,
                onChanged: (int? value) {},
              ),
              onTap: () {},
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        children: [
          buildExpansionTile(
            'SECTION 1',
            [
              'CLASS 1: ABOUT FLUTTER AND DART INTRODUCTION',
              'CLASS 2: INSTALL, SETUP DART & CREATE A SIMPLE DART'
            ],
          ),
          buildExpansionTile(
            'SECTION 2',
            [
              'CLASS 1: DATA TYPE AND VARIABLES',
              'CLASS 2: INTEGER DATA TYPE WORKOUT(INT, DOUBLE, NUM, VAR)'
            ],
          ),
          buildExpansionTile(
            'SECTION 3',
            [
              'CLASS 1: KEYBOARD INTERATION, TYPE CASTING, CONSTANTS',
              'CLASS 2: CONTROL FLOW STATEMENTS SLIDE PRESENTATION'
            ],
          ),
        ],
      ),
    );
  }
}
