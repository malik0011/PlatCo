import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // Set the status bar color
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PlatCo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Any state variable will go here
  final String userName = "Iron Man";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF3A5A97), // Set your desired color
        statusBarIconBrightness: Brightness.light, // Adjust icon brightness
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      IconButton(
                        iconData: Icons.navigate_next,
                        size: 25,
                        onTap: () {
                          print("Message icon clicked!");
                          // Perform your custom action here
                        },
                      ),
                      SizedBox(width: 28),
                      SizedBox(
                        height: 50, // Desired height
                        width: 50,  // Desired width (should be equal to height for a perfect circle)
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://www.cinemascomics.com/wp-content/uploads/2024/04/iron-man-regreso-a-marvel-studios.jpg',
                          ),
                        ),
                      ),
                      SizedBox(width: 22),
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: 16, // Set the desired font size
                          fontWeight: FontWeight.bold, // Optional: Adjust font weight
                          color: Colors.black, // Optional: Set text color
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      IconButton(
                        iconData: Icons.message,
                        size: 21,
                        onTap: () {
                          print("Message icon clicked!");
                          // Perform your custom action here
                        },
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        iconData: Icons.video_call,
                        size: 21,
                        onTap: () {
                          print("Message icon clicked!");
                          // Perform your custom action here
                        },
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        iconData: Icons.call,
                        size: 21,
                        onTap: () {
                          print("Message icon clicked!");
                          // Perform your custom action here
                        },
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              LinearProgressIndicator(
                value: 0.7, // 70% progress
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3A5A97)),
                minHeight: 1.0, // Minimum height of the line
              ),
              SizedBox(height: 16),
              // Wrap DynamicListExample with an Expanded widget to fix overflow issue
              Expanded(child: DynamicListExample())
            ],
          ),
        ),
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  final IconData iconData; // Declare the iconData field
  final double size; // Declare the size field
  final VoidCallback onTap; // Callback for click action

  const IconButton({
    required this.iconData, // Initialize iconData
    required this.size, // Initialize size
    required this.onTap, // Initialize the callback
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use the callback when the icon is clicked
      child: Icon(
        iconData,
        color: Color(0xFF3A5A98),
        size: size,
      ),
    );
  }
}

class DynamicListExample extends StatefulWidget {
  const DynamicListExample({super.key});

  @override
  _DynamicListExampleState createState() => _DynamicListExampleState();
}
class DataItem {
  final String value;
  final int type;

  DataItem(
    this.value, // Initialize iconData
    this.type, // Initialize size
  );
}

class _DynamicListExampleState extends State<DynamicListExample> {
  // Mutable list of items

  List<DataItem> items = [
    DataItem("Hi, How are you", 1),
    DataItem("Hi, How are you", 2),
    DataItem("Hi, How are you", 1),
    DataItem("Hi, How are you", 1),
  ];

  // Method to add a new item to the list
  void addItem(int type) {
    setState(() {
      items.add(DataItem("New Item", type));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        if(items[index].type == 1) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Color(0xFF3A5A97),
                child: GestureDetector(
                  onTap: () {
                    addItem(1);
                  }, // Use the callback when the icon is clicked
                  child:Text(
                    items[index].value,
                    style: TextStyle(fontSize: 18),
                  ),
              ),
            )
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Color(0xFFBAC0CB),
              child: GestureDetector(
                  onTap: () {
                    addItem(2);
                  }, // Use the callback when the icon is clicked
                  child:Text(
                    items[index].value,
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 18),
                  ),
              ),
            )
          );
        }

      },
    );
  }
}
