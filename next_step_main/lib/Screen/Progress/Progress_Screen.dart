import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  // Sample data for progress (you can replace this with actual data)
  double progress = 0.6;  // Example: 60% progress on the selected day
  final Map<DateTime, String> sessionReminders = {
    DateTime(2025, 1, 5): "Yoga Class - 10:00 AM",
    DateTime(2025, 1, 10): "Meditation Session - 12:00 PM",
  };

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
  'Progress Tracker',
  style: TextStyle(
    fontWeight: FontWeight.bold,  // Makes the text bold
  ),
),

        backgroundColor: const Color(0xFF4B5945),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCalendar(),
              const SizedBox(height: 16),
              _buildProgressCard(),
              const SizedBox(height: 16),
              _buildMotivationalMessage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 01, 01),
        lastDay: DateTime.utc(2025, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          _updateProgressForSelectedDay();

          // Check if there's a session reminder for the selected day
          if (sessionReminders.containsKey(selectedDay)) {
            _showSessionReminder(selectedDay);
          }
        },
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: const Color(0xFF4B5945),
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: const Color(0xFFB2C9AD),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _buildProgressCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Progress for ${_selectedDay.toLocal().toString().split(' ')[0]}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 12.0,
              percent: progress,
              center: Text(
                "${(progress * 100).toInt()}%",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              progressColor: const Color(0xFF4B5945),
              backgroundColor: Colors.grey[300]!,
            ),
            const SizedBox(height: 16),
            Text(
              "Keep up the great work! Continue your journey towards recovery.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMotivationalMessage() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "You're doing great! Keep pushing forward and celebrate each small victory. Recovery is a journey, not a destination!",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "Total Progress: ${(progress * 100).toInt()}%",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void _updateProgressForSelectedDay() {
    setState(() {
      progress = 0.6 + (0.4 * (_selectedDay.day / 30));  // Example: progress based on day of the month
    });
  }

  // Show a popup dialog for session reminders
  void _showSessionReminder(DateTime selectedDay) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Session Reminder"),
          content: Text(sessionReminders[selectedDay]!),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
