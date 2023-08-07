import 'package:flutter/material.dart';

class CreateTask extends StatelessWidget {
  const CreateTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),

            // Row with chevron left and more vert
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 45,
                    color: Color(0xFFEE6F57),
                  ),
                  Icon(Icons.more_vert, size: 40),
                ],
              ),
            ),


            // Create New Task text
            const Center(
              child: Text(
                "Create New Task",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Gray color line break
            Expanded(
              child: Center(
                child: Divider(
                  color: Colors.black.withOpacity(0.2),
                  height: 20.0,
                  thickness: 1.0,
                ),
              ),
            ),


            const Padding(
              padding: EdgeInsets.only(
                  bottom: 10, left: 10), // Adjust values as needed
              child: Text(
                "Main Task Name",
                style: TextStyle(
                  color: Color(0xFFEE6F57),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            TextField(
              
              decoration: InputDecoration(
                hintText: 'UI/UX app Design',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                contentPadding: const EdgeInsets.all(15.0),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20.0),

            // Due Date with calendar icon

            const Padding(
              padding: EdgeInsets.only(
                  bottom: 10, left: 10), // Adjust values as needed
              child: Text(
                "Due Date",
                style: TextStyle(
                  color: Color(0xFFEE6F57),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'April 29,2023 12:30 AM',

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                contentPadding: const EdgeInsets.all(15.0),
                filled: true,
                fillColor: Colors.grey[100],
                suffixIcon: const Icon(
                  Icons.calendar_month,
                  color: Color(0xFFEE6F57),
                ),
              ),
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,

              ),
            ),

            const SizedBox(height: 20.0),

            // Description input field
            const Padding(
              padding: EdgeInsets.only(
                  bottom: 10, left: 10), // Adjust values as needed
              child: Text(
                "Description",
                style: TextStyle(
                  color: Color(0xFFEE6F57),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'First I have to animate the logo and later prototyping my design. It\'s very importand',

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                contentPadding: const EdgeInsets.all(12.0),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20.0),

            // Add Task button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add task logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFEE6F57), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    minimumSize: const Size(180, 50), // Adjust the size
                  ),
                  child: const Text(
                    'Add Task',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
