import 'package:flutter/material.dart';

class EmergencySupportScreen extends StatelessWidget {
  const EmergencySupportScreen({Key? key}) : super(key: key);

  static const Color customPrimaryColor = const Color.fromARGB(255, 78, 133, 86); // Earthy green shade
  static const Color customSecondaryColor = Color(0xFF9C5441); // Warm brownish color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sponsor & Donation",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: customPrimaryColor,
      ),
      backgroundColor: const Color(0xFFB2C9AD),
      body: Stack(
        children: [
          SingleChildScrollView( // Enables scrolling
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 80.0, // Leaves space for the button
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  _buildImpactHeader(),
                  const SizedBox(height: 32),

                  // Impact Stats Section
                  _buildImpactStats(),
                  const SizedBox(height: 32),

                  // Donation Listing Section
                  const Text(
                    "Available Donations",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: customSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildDonationTabs(context),
                ],
              ),
            ),
          ),

          // Apply Button Positioned at the Bottom
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: ElevatedButton(
              onPressed: () {
                // Define the action here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Apply button clicked!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 78, 133, 86),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text(
                "Apply Now",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Impact Header
  Widget _buildImpactHeader() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Make an Impact Today",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 78, 133, 86),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Together, we can make a difference in the lives of students and individuals who need support. Choose a cause and make a lasting impact!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Impact Stats
  Widget _buildImpactStats() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatCard("Donations", "1,245"),
            _buildStatCard("NGOs", "56"),
            _buildStatCard("Impact", "85%"),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 78, 133, 86),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // Widget for Donation Tabs
  Widget _buildDonationTabs(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: const Color.fromARGB(255, 78, 133, 86),
            unselectedLabelColor: Colors.grey,
            indicatorColor: const Color.fromARGB(255, 78, 133, 86),
            tabs: const [
              Tab(text: "NGO"),
              Tab(text: "Govt Org"),
              Tab(text: "Individual"),
            ],
          ),
          SizedBox(
            height: 400, // To prevent overflow
            child: TabBarView(
              children: [
                _buildDonationList("NGO"),
                _buildDonationList("Govt Org"),
                _buildDonationList("Individual"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Donation List
  Widget _buildDonationList(String tabTitle) {
    List<Map<String, String>> donationItems;

    // Sample data
    if (tabTitle == "NGO") {
      donationItems = [
        {
          "name": "Teach For India",
          "description": "Providing quality education to underprivileged children.",
          "image": "assets/images/SD1.png", // Updated image path
          "type": "Educational Support"
        },
        {
          "name": "Save The Children",
          "description": "Focused on improving education and health for children.",
          "image": "assets/images/SD2.png",
          "type": "Child Welfare"
        },
      ];
    } else if (tabTitle == "Govt Org") {
      donationItems = [
        {
          "name": "Ministry of Education",
          "description": "Supporting educational schemes for underprivileged students.",
          "image": "assets/images/SD3.png",
          "type": "Government Grants"
        },
      ];
    } else {
      donationItems = [
        {
          "name": "John Doe",
          "description": "Donated devices for rural students' education.",
          "image": "assets/images/logo1.jpeg",
          "type": "Device Donation"
        },
      ];
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: donationItems.length,
      itemBuilder: (context, index) {
        final item = donationItems[index];
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(item["image"]!),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["name"]!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(item["description"]!),
                      const SizedBox(height: 4),
                      Text(
                        "Donation Type: ${item["type"]!}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
