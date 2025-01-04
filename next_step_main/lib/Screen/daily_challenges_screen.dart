import 'package:flutter/material.dart';

class DailyChallengesScreen extends StatefulWidget {
  const DailyChallengesScreen({Key? key}) : super(key: key);

  @override
  _DailyChallengesScreenState createState() => _DailyChallengesScreenState();
}

class _DailyChallengesScreenState extends State<DailyChallengesScreen> {
  // List of tasks with additional data (date and completion status)
  List<Map<String, dynamic>> tasks = [
    {
      'task': 'Morning Meditation',
      'isCompleted': false,
      'date': DateTime.now().subtract(Duration(days: 1)),
      'completedOn': null
    },
    {
      'task': 'Drink 8 Glasses of Water',
      'isCompleted': false,
      'date': DateTime.now(),
      'completedOn': null
    },
    {
      'task': '30 Minutes of Exercise',
      'isCompleted': false,
      'date': DateTime.now().subtract(Duration(days: 2)),
      'completedOn': null
    },
    {
      'task': 'Read 30 Pages of a Book',
      'isCompleted': false,
      'date': DateTime.now(),
      'completedOn': null
    },
    {
      'task': 'Avoid Junk Food',
      'isCompleted': false,
      'date': DateTime.now().subtract(Duration(days: 3)),
      'completedOn': null
    },
  ];

  // Function to mark all tasks as completed
  void _markAllTasksCompleted() {
    setState(() {
      for (var task in tasks) {
        task['isCompleted'] = true;
        task['completedOn'] = DateTime.now(); // Set the completion date
      }
    });
  }

  // Function to update task completion status
  void _toggleTaskCompletion(int index, bool? value) {
    setState(() {
      tasks[index]['isCompleted'] = value ?? false;
      if (value == true) {
        tasks[index]['completedOn'] = DateTime.now(); // Set completion date
      } else {
        tasks[index]['completedOn'] = null; // Reset completion date if unchecked
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate completed tasks count
    int completedTasks = tasks.where((task) => task['isCompleted'] == true).toList().length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Challenges", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF4CAF50), // Green color for a fresh feel
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Bar indicating completion status
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: LinearProgressIndicator(
                value: completedTasks / tasks.length,
                backgroundColor: Colors.grey[200],
                color: const Color(0xFF4CAF50),
                minHeight: 8,
              ),
            ),
            // Displaying completed tasks count with updated style
            Text(
              '$completedTasks / ${tasks.length} tasks completed',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            // List of tasks with checkboxes, dates, and completion data
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  String taskDate =
                      "${tasks[index]['date'].day}/${tasks[index]['date'].month}/${tasks[index]['date'].year}";
                  String completedDate = tasks[index]['completedOn'] != null
                      ? "Completed on: ${tasks[index]['completedOn'].day}/${tasks[index]['completedOn'].month}/${tasks[index]['completedOn'].year}"
                      : "Not completed yet";

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 3,
                    color: tasks[index]['isCompleted'] ? Colors.green[50] : Colors.white,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        tasks[index]['task'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: tasks[index]['isCompleted'] ? Colors.green : Colors.black87,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Task Date: $taskDate",
                            style: const TextStyle(fontSize: 14, color: Colors.black45),
                          ),
                          Text(
                            completedDate,
                            style: TextStyle(
                              fontSize: 14,
                              color: tasks[index]['isCompleted'] ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                      trailing: Checkbox(
                        value: tasks[index]['isCompleted'],
                        onChanged: (bool? value) {
                          _toggleTaskCompletion(index, value);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Button to mark all tasks as completed with better design
            Center(
              child: ElevatedButton(
                onPressed: _markAllTasksCompleted,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50), // Corrected property
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Complete All Tasks',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
