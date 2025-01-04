import 'package:flutter/material.dart';
import 'package:next_step/Const/const_fonts.dart';
import 'package:next_step/Const/const_img.dart';


Widget BestStoreiesWidget() {
  return Column(
    crossAxisAlignment:
        CrossAxisAlignment.start, // Aligns text to the start (left)
    children: [
      // Heading with arrow icon
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 10), // Padding around the text
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Aligns heading and icon on opposite sides
          children: [
            Text(
              "Sessions", // Text heading
              style: TextStyle(
                fontFamily: boldfont,
                fontSize: 16, // Font size of the heading
                color: Colors.black, // Text color
              ),
            ),
            Icon(
              Icons.arrow_forward, // Arrow icon
              size: 20, // Icon size
              color: Colors.black, // Icon color
            ),
          ],
        ),
      ),
      // Row of event boxes
      SingleChildScrollView(
        scrollDirection:
            Axis.horizontal, // Makes the row scrollable horizontally
        child: Row(
          children: [
            // Box 1
            BeststoriesBox(),
            // Box 2
           BeststoriesBox(),
            // Box 3
            BeststoriesBox(),
            // Add more boxes as needed
          ],
        ),
      ),
    ],
  );
}

Widget BeststoriesBox() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10), // Space between boxes
    child: Material(
      elevation: 4, // Adds a slight elevation for shadow effect
      borderRadius: BorderRadius.circular(20), // Rounded corners
      child: Container(
        width: 150,
        height: 200, // Width and height of each box
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(20), // Ensures image respects border radius
          child: Stack(
            children: [
              // Fill the entire container with the image
              Image.asset(
                logo, // Replace with your image path
                fit: BoxFit.cover, // Fills the container
                width: double.infinity,
                height: double.infinity,
              ),
              // Like Icon at the top-right corner
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 30, // Diameter of the circular background
                  height: 30,
                  decoration: BoxDecoration(
                    color:
                        Colors.white60, // Background color of the circular box
                    shape: BoxShape.circle, // Makes the container circular
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black
                              .withOpacity(0.1), // Slight shadow for depth
                          blurRadius: 4,
                          ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: Color(0xFF91AC8F), // Color of the like icon
                      size: 24,
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
                      horizontal: 8, vertical: 4), // Padding inside the button
                  decoration: BoxDecoration(
                    color: Colors.black
                        .withOpacity(0.3), // Semi-transparent background
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  child: Text(
                    "Tokyo", // Dummy event name
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: boldfont,
                      color: Colors.white, // White text color
                    ),
                    overflow: TextOverflow
                        .ellipsis, // Ensures the text doesn't overflow
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
