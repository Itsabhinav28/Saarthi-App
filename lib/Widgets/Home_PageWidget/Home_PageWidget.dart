import 'package:flutter/material.dart';
import 'package:next_step/screen/peer_counseling_screen.dart';
import 'package:next_step/screen/subject_screen.dart';
import 'package:next_step/screen/daily_challenges_screen.dart';
import 'package:next_step/screen/emergency_support_screen.dart';

class MainSectionWidget extends StatelessWidget {
  const MainSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sectionWidth = (MediaQuery.of(context).size.width / 2) - 24; // Dynamic width
    const double sectionHeight = 120.0; // Fixed height for all panels

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSectionBox(
                context,
                title: "Counseling",
                icon: Icons.support_agent,
                color: const Color(0xFF4B5945),
                width: sectionWidth,
                height: sectionHeight,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PeerCounselingScreen()),
                  );
                },
              ),
              _buildSectionBox(
  context,
  title: "AR Learning",
  icon: Icons.view_in_ar,  // AR-related icon
  color: const Color(0xFF6D9F71),
  width: sectionWidth,
  height: sectionHeight,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubjectScreen()),
    );
  },
),

            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSectionBox(
                context,
                title: "Daily Challenges",
                icon: Icons.flag_outlined,
                color: const Color.fromARGB(255, 78, 133, 86),
                width: sectionWidth,
                height: sectionHeight,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DailyChallengesScreen()),
                  );
                },
              ),
              _buildSectionBox(
  context,
  title: "Sponsor & Donation",
  icon: Icons.card_giftcard, // Changed to a more suitable icon for sponsorship and donations
  color: const Color(0xFF9C5441),
  width: sectionWidth,
  height: sectionHeight,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmergencySupportScreen()),
    );
  },
)

            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionBox(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required double width,
    required double height,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height, // Uniform height for all panels
        decoration: BoxDecoration(
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24.0,
              child: Icon(icon, size: 24.0, color: color),
            ),
            const SizedBox(height: 12.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.035, // Responsive font size
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

