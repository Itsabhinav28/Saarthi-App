import 'package:flutter/material.dart';
import 'package:next_step/Const/const_fonts.dart';
import 'package:next_step/Const/const_img.dart';
import 'package:url_launcher/url_launcher.dart';

Widget BestStoreiesWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Heading with arrow icon
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sessions",
              style: TextStyle(
                fontFamily: boldfont,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              size: 20,
              color: Colors.black,
            ),
          ],
        ),
      ),
      // Row of event boxes
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            BeststoriesBox(),
            BeststoriesBox(),
            BeststoriesBox(),
          ],
        ),
      ),
    ],
  );
}

Widget BeststoriesBox() {
  return Builder(
    builder: (context) {
      // Calculate width and height dynamically based on the screen size
      final screenWidth = MediaQuery.of(context).size.width;
      final boxWidth = screenWidth * 0.4; // 40% of screen width
      final boxHeight = screenWidth * 0.5; // Adjust height proportionally

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // Dynamic padding
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: () async {
              const url =
                  "https://www.spatial.io/s/ROOM-661975d970f7d10e5463df58?share=662097194052729954";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw "Could not launch $url";
              }
            },
            child: Container(
              width: boxWidth,
              height: boxHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    // Fill the container with the image
                    Image.asset(
                      'assets/images/Classroom.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    // Like Icon at the top-right corner
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: boxWidth * 0.15, // Adjust icon size relative to box width
                        height: boxWidth * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite,
                            color: Color(0xFF91AC8F),
                            size: boxWidth * 0.08, // Adjust icon size dynamically
                          ),
                        ),
                      ),
                    ),
                    // Event Title as a semi-transparent button at the bottom-left
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: boxWidth * 0.05,
                          vertical: boxHeight * 0.02,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "LIVE",
                          style: TextStyle(
                            fontSize: boxWidth * 0.08, // Adjust font size dynamically
                            fontFamily: boldfont,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

