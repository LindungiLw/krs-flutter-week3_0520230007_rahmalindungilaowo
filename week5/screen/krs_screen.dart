import 'package:flutter/material.dart';
import 'krs_detail_screen.dart';

class KrsScreen extends StatefulWidget {
  const KrsScreen({super.key});

  @override
  State<KrsScreen> createState() => _KrsScreenState();
}

class _KrsScreenState extends State<KrsScreen> {
  List<Map<String, dynamic>> selectedCourses = [];
  int totalSKS = 0;

  final List<Map<String, dynamic>> availableCourses = [
    {'name': 'Mobile Programming', 'sks': 3},
    {'name': 'Database Systems', 'sks': 4},
    {'name': 'MIS', 'sks': 2},
    {'name': 'Web Programming', 'sks': 3},
  ];

  String? currentSelection;

  void addCourse() {
    if (currentSelection == null) return;

    var courseData = availableCourses.firstWhere((c) => c['name'] == currentSelection);
    int courseSks = courseData['sks'];

    bool isDuplicate = selectedCourses.any((c) => c['name'] == currentSelection);

    if (isDuplicate) {
      _showWarning("Course Already Selected!");
    }

    else if (totalSKS + courseSks > 24) {
      _showWarning("SKS Limit Exceeded! Max 24.");
    }
    else {
      setState(() {
        selectedCourses.add({'name': currentSelection, 'sks': courseSks});
        totalSKS += courseSks;
      });
    }
  }

  void _showWarning(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form KRS - Rahma"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DropdownButton<String>(
              isExpanded: true,
              hint: const Text("Select Course"),
              value: currentSelection,
              items: availableCourses.map((course) {
                return DropdownMenuItem<String>(
                  value: course['name'],
                  child: Text("${course['name']} (${course['sks']} SKS)"),
                );
              }).toList(),
              onChanged: (val) => setState(() => currentSelection = val),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: addCourse,
              child: const Text("Add to List"),
            ),
            const Divider(height: 40),
            Text("Total SKS: $totalSKS / 24",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            Expanded(
              child: ListView.builder(
                itemCount: selectedCourses.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(selectedCourses[index]['name']),
                  trailing: Text("${selectedCourses[index]['sks']} SKS"),
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: selectedCourses.isEmpty ? null : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KrsDetailScreen(
                        finalList: selectedCourses,
                        finalSks: totalSKS,
                      ),
                    ),
                  );
                },
                child: const Text("Submit to Preview", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}