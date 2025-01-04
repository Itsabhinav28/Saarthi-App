import 'package:flutter/material.dart';

class PeerCounselingScreen extends StatelessWidget {
  const PeerCounselingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for counseling sessions, including image URL for each counselor
    final List<Map<String, String>> counselingSessions = [
      {
        "counselor": "Dr. Amit Sharma",
        "expertise": "Mental Health & Wellness",
        "time": "10:00 AM - 11:00 AM",
        "image": "assets/images/logo.jpg" // Replace with actual image asset or URL
      },
      {
        "counselor": "Ms. Priya Verma",
        "expertise": "Career Counseling",
        "time": "1:00 PM - 2:00 PM",
        "image": "assets/images/logo.jpg" // Replace with actual image asset or URL
      },
      {
        "counselor": "Mr. Rajeev Kumar",
        "expertise": "Stress Management",
        "time": "4:00 PM - 5:00 PM",
        "image": "assets/images/logo.jpg" // Correct path with forward slashes
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Peer Counseling",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor:  const Color.fromARGB(255, 78, 133, 86),
      ),
      backgroundColor:  const Color(0xFFB2C9AD),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: counselingSessions.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Circular image of the counselor
                    Center(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(counselingSessions[index]['image']!),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Counselor's Name
                    Text(
                      counselingSessions[index]['counselor']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Expertise
                    Text(
                      "Expertise: ${counselingSessions[index]['expertise']!}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Time of session
                    Text(
                      "Time: ${counselingSessions[index]['time']!}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Join button
                    ElevatedButton(
                      onPressed: () {
                        // Handle Join action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  const Color.fromARGB(255, 78, 133, 86),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Join',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
