import 'package:flutter/material.dart';

class KrsDetailScreen extends StatelessWidget {
  final List<Map<String, dynamic>> finalList;
  final int finalSks;

  const KrsDetailScreen({super.key, required this.finalList, required this.finalSks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("KRS Preview Summary")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Please review your selected courses:", style: TextStyle(fontSize: 18)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, i) => ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.green),
                title: Text(finalList[i]['name']),
                subtitle: Text("${finalList[i]['sks']} SKS"),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.grey[200],
            child: Column(
              children: [
                Text("Total Credits: $finalSks SKS", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("KRS Successfully Saved!")));
                    Navigator.pop(context);
                  },
                  child: const Text("Confirm & Submit Final"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}