import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

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
      {"name": "AR Geometry", "model": "assets/models/ar_geometry_model.glb", "description": "Learn geometry concepts interactively using AR."},
      {"name": "AR Chemistry Lab", "model": "assets/models/ar_chemistry_model.glb", "description": "Explore chemistry experiments and molecular structures with AR."},
      {"name": "Historical Monuments AR", "model": "assets/models/ar_monuments_model.glb", "description": "Explore historical monuments in AR and interact with them."},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("AR Learning", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF6D9F71),
      ),
      backgroundColor: Colors.white,  // Set Scaffold background to white
      body: Stack(
        children: [
          // Background Image (Optional)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/GETSTARTEDBG.png'), // Optional background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    physics: const NeverScrollableScrollPhysics(),
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
                            style: const TextStyle(
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
                  // Displaying AR tools with ModelViewer
                  ...arTools.asMap().entries.map((entry) {
                    int index = entry.key;
                    String model = entry.value['model']!;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          // Handle AR tool interaction here (if needed)
                        },
                        child: Container(
                          width: 250,
                          height: 360,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Constrained ModelViewer widget for AR tools
                              Container(
                                width: 200,
                                height: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: ModelViewer(
                                    backgroundColor: Colors.transparent,
                                    src: model,
                                    alt: 'AR Tool ${index + 1}',
                                    ar: true,
                                    autoRotate: false,
                                    disableZoom: false,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                arTools[index]['name']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                arTools[index]['description']!,
                                style: const TextStyle(fontSize: 14, color: Colors.black45),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
