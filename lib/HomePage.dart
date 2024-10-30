import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedSection = 'Personal Info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume'),
      ),
      body: Row(
        children: [
          // Sidebar for Navigation
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                  ),
                  const Text(
                    'Munia Akter Mariam',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    '+880-1878125245\n  aktermariammunia@gmail.com',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  buildNavButton('Personal Info'),
                  buildNavButton('Skills'),
                  buildNavButton('Education'),
                  buildNavButton('Experience'),
                ],
              ),
            ),
          ),

          // Main content for details
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: getDetailsWidget(selectedSection),
            ),
          ),
        ],
      ),
    );
  }

  // Navigation button builder
  Widget buildNavButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedSection = title;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(title, style: const TextStyle(fontSize: 18)),
      ),
    );
  }

  // Widget that returns details for the selected section
  // Widget that returns details for the selected section
  Widget getDetailsWidget(String section) {
    switch (section) {
      case 'Personal Info':
        return const Text(
          'Name: Munia Akter Mariam\n'
              'Phone: (+880) 1878125245\n'
              'Email: aktermarriammunnia@gmail.com\n'
              'Location: Chittagong,Bangladesh\n'
              'LinkedIn: https://www.linkedin.com/in/munia-mariam-47b060202\n'
              'GitHub: https://github.com/Mariam56-web',
          style: TextStyle(fontSize: 18),
        );
      case 'Skills':
        return const Text(
          '• Programming Languages: Dart, Python, C++\n'
              '• Frameworks: Flutter, TensorFlow, Django\n'
              '• Tools: Git, Docker, Jenkins\n'
              '• Soft Skills: Problem-solving, Teamwork, Communication,Microsoft-office',
          style: TextStyle(fontSize: 18),
        );
      case 'Education':
        return const Text(
          'Bachelor of Science in Computer Science\n'
              'International Islamic University Chittagong, 2020- 2024\n'
              'GPA: 3.5/4.0\n'
              'Relevant Coursework: Data Structures,Software Development ,competitive Programming,Computer Graphics, Algorithms, Artificial Intelligence,Machine Learning, Mobile App Development',
          style: TextStyle(fontSize: 16),
        );
      case 'Experience':
        return const Text(
          'Campus Ambassador'
              'National Girls Programming contest, June 2022 - December 2022\n'
              '- Developed Face Recognition App using Django Framework\n'
              '- Collaborated with a team to design and implement new features\n'
              '- Integrated REST APIs and improved app performance\n'
              '- Designed and developed responsive websites for Courses\n'
              '- Worked with HTML, CSS, JavaScript, and backend technologies\n'
              '- Managed multiple projects with tight deadlines\n',
          style: TextStyle(fontSize: 18),
        );
      default:
        return const Text('Select a section to see details.');
    }
  }

}


