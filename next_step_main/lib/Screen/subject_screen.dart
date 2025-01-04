import 'package:flutter/material.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> subjects = [
      {"name": "Mathematics", "pdf": "assets/math_resources.pdf"},
      {"name": "Science", "pdf": "assets/science_resources.pdf"},
      {"name": "History", "pdf": "assets/history_resources.pdf"},
    ];

    final List<Map<String, String>> arTools = [
      {"name": "AR Geometry", "description": "Learn geometry concepts interactively using AR.", "tool": "AR Geometry Tool"},
      {"name": "AR Chemistry Lab", "description": "Explore chemistry experiments and molecular structures with AR.", "tool": "AR Chemistry Tool"},
      {"name": "Historical Monuments AR", "description": "Explore historical monuments in AR and interact with them.", "tool": "Historical Monuments AR"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Subjects & AR Learning",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF6D9F71),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section for Subjects
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Subjects",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              // Displaying subject list
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 3,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        subjects[index]['name']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      trailing: const Icon(Icons.picture_as_pdf),
                      onTap: () {
                        // Open PDF viewer here (use packages like pdf_flutter or flutter_pdfview)
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              // Section for AR Learning Tools
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "AR Learning Tools",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              // Displaying AR tools
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: arTools.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 3,
                    color: Colors.grey[50],
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        arTools[index]['name']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        arTools[index]['description']!,
                        style: const TextStyle(fontSize: 14, color: Colors.black45),
                      ),
                      trailing: const Icon(Icons.touch_app),
                      onTap: () {
                        // Open AR tool (use packages for AR integration like ARCore, Vuforia)
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              // A button to launch AR tools
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to AR tools or more information
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6D9F71),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Explore AR Tools',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
