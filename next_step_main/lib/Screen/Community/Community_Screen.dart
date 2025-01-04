import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final List<Map<String, dynamic>> blogs = [
    {
      'userName': 'Alice',
      'userImage': 'assets/images/logo.jpg',
      'blogImage': 'assets/images/logo.jpg',
      'blogContent': 'Discover the beauty of sustainable living and eco-friendly practices.',
      'liked': false,
      'expanded': false,
    },
    {
      'userName': 'Bob',
      'userImage': 'assets/images/logo.jpg',
      'blogImage': 'assets/images/logo.jpg',
      'blogContent': 'Explore the secrets of mindfulness and its benefits for a healthy mind.',
      'liked': false,
      'expanded': false,
    },
    {
      'userName': 'Carol',
      'userImage': 'assets/images/logo.jpg',
      'blogImage': 'assets/images/logo.jpg',
      'blogContent': 'Learn how to grow your garden even in limited spaces.',
      'liked': false,
      'expanded': false,
    },
  ];

  final List<Map<String, dynamic>> leaderboard = [
    {'userName': 'John Doe', 'points': 1200, 'profileImage': 'assets/images/john.jpg'},
    {'userName': 'Jane Smith', 'points': 1100, 'profileImage': 'assets/images/jane.jpg'},
    {'userName': 'Alice Johnson', 'points': 1000, 'profileImage': 'assets/images/alice.jpg'},
    {'userName': 'Bob Brown', 'points': 950, 'profileImage': 'assets/images/bob.jpg'},
    {'userName': 'Carol White', 'points': 900, 'profileImage': 'assets/images/carol.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB2C9AD),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
  "Community",
  style: TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold,  // Makes the text bold
  ),
),

            backgroundColor: const Color(0xFF4B5945),
            expandedHeight: 120.0,
            floating: false,
            pinned: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/logo.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: const Color.fromARGB(255, 78, 133, 86),
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: const Color.fromARGB(255, 78, 133, 86),
                      tabs: const [
                        Tab(text: "Leaderboard"),
                        Tab(text: "Blogs"),
                      ],
                    ),
                    SizedBox(
                      height: 400, // To prevent overflow
                      child: TabBarView(
                        children: [
                          // Leaderboard Tab
                          _buildLeaderboardTab(),
                          // Blog Tab
                          _buildBlogTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Leaderboard Tab
  Widget _buildLeaderboardTab() {
    return ListView.builder(
      itemCount: leaderboard.length,
      itemBuilder: (context, index) {
        final profile = leaderboard[index];
        Color medalColor = Colors.grey; // Default for 4th and below
        String rankText = '';

        if (index == 0) {
          medalColor = Color(0xFFFFD700); // Gold color
          rankText = '1st';
        } else if (index == 1) {
          medalColor = Color(0xFFB0C4DE); // Silver color
          rankText = '2nd';
        } else if (index == 2) {
          medalColor = Color(0xFFCD7F32); // Bronze color
          rankText = '3rd';
        }

        return LeaderboardWidget(
          userName: profile['userName'],
          points: profile['points'],
          rankText: rankText,
          medalColor: medalColor,
          profileImage: profile['profileImage'],
        );
      },
    );
  }

  // Widget for Blog Tab
  Widget _buildBlogTab() {
    return ListView.builder(
      itemCount: blogs.length,
      itemBuilder: (context, index) {
        final blog = blogs[index];
        return BlogWidget(
          userName: blog['userName'],
          userImage: blog['userImage'],
          blogImage: blog['blogImage'],
          blogContent: blog['blogContent'],
          isLiked: blog['liked'],
          isExpanded: blog['expanded'],
          onLike: () {
            setState(() {
              blogs[index]['liked'] = !blogs[index]['liked'];
            });
          },
          onExpand: () {
            setState(() {
              blogs[index]['expanded'] = !blogs[index]['expanded'];
            });
          },
        );
      },
    );
  }
}

// Blog Widget
class BlogWidget extends StatelessWidget {
  final String userName;
  final String userImage;
  final String blogImage;
  final String blogContent;
  final bool isLiked;
  final bool isExpanded;
  final VoidCallback onLike;
  final VoidCallback onExpand;

  const BlogWidget({
    required this.userName,
    required this.userImage,
    required this.blogImage,
    required this.blogContent,
    required this.isLiked,
    required this.isExpanded,
    required this.onLike,
    required this.onExpand,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: Image.asset(
              blogImage,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blogContent,
                  maxLines: isExpanded ? null : 2,
                  overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: onExpand,
                  child: Text(
                    isExpanded ? "Show less" : "Read more",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(userImage),
                  radius: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                    color: isLiked ? Colors.blue : Colors.grey,
                  ),
                  onPressed: onLike,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

// Leaderboard Widget
class LeaderboardWidget extends StatelessWidget {
  final String userName;
  final int points;
  final String rankText;
  final Color medalColor;
  final String profileImage;

  const LeaderboardWidget({
    required this.userName,
    required this.points,
    required this.rankText,
    required this.medalColor,
    required this.profileImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: medalColor,
                shape: BoxShape.circle,
              ),
              child: Text(
                rankText,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 12),
            CircleAvatar(
              backgroundImage: AssetImage(profileImage),
              radius: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                userName,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '$points points',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
