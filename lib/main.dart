import 'package:flutter/material.dart';

void main() {
  runApp(AstroraApp());
}

class AstroraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astrora',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// First Page: Home Page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Curved Section
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade700],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.star, size: 30, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  'Astrora',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Welcome Section
          SizedBox(height: 50),
          Text(
            'Hey Welcome to Astrora!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),

          // Card with Button
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'First you have to just answer some basic questions to get you started',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                        ),
                      ),
                      child: Text('Let\'s Start'),
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
}

// Second Page: Questions Form
class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController techKnowledgeController = TextEditingController();

  String? familiarity;
  String? educationLevel;
  bool is18OrOlder = false;
  bool acceptsTerms = false;

  int techKnowledgeLength = 0; // Variable to track character length

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Astrora'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade400, Colors.blue.shade700],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.star, size: 30, color: Colors.blue),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Astrora',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Question 1
              Text(
                  '1. How familiar are you with interacting with AI-powered chat systems?'),
              ListTile(
                title: const Text('Very Familiar'),
                leading: Radio<String>(
                  value: 'Very Familiar',
                  groupValue: familiarity,
                  onChanged: (value) {
                    setState(() {
                      familiarity = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Somewhat Familiar'),
                leading: Radio<String>(
                  value: 'Somewhat Familiar',
                  groupValue: familiarity,
                  onChanged: (value) {
                    setState(() {
                      familiarity = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Not Familiar'),
                leading: Radio<String>(
                  value: 'Not Familiar',
                  groupValue: familiarity,
                  onChanged: (value) {
                    setState(() {
                      familiarity = value;
                    });
                  },
                ),
              ),
              Divider(),

              // Question 2
              Text('2. What is your current occupation?'),
              TextField(
                controller: occupationController,
                decoration: InputDecoration(
                  hintText: 'Enter your occupation',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Question 3
              Text('3. Are you 18 years or older?'),
              CheckboxListTile(
                value: is18OrOlder,
                onChanged: (value) {
                  setState(() {
                    is18OrOlder = value!;
                  });
                },
                title: Text('Yes, I am 18 or older'),
              ),
              Divider(),

              // Question 4
              Text('4. Describe your knowledge in technology (max 300 words)'),
              TextField(
                controller: techKnowledgeController,
                maxLines: 5,
                maxLength: 300,
                decoration: InputDecoration(
                  hintText: 'Enter your response',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  setState(() {
                    techKnowledgeLength = text.length;
                  });
                },
              ),
              SizedBox(height: 10),
              Text('Characters used: $techKnowledgeLength / 300'),
              Divider(),

              // Terms and Conditions
              CheckboxListTile(
                value: acceptsTerms,
                onChanged: (value) {
                  setState(() {
                    acceptsTerms = value!;
                  });
                },
                title: Text('I accept the terms and conditions'),
              ),
              Divider(),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: acceptsTerms && techKnowledgeLength <= 300
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThirdPage(
                                userName: occupationController.text,
                              ),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        (acceptsTerms && techKnowledgeLength <= 300)
                            ? Colors.blue
                            : Colors.grey,
                  ),
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  final String userName;

  ThirdPage({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Astrora'),
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade700],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.star, size: 30, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  'Astrora',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Spacer between header and content
          SizedBox(height: 50),

          // Main Content
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Astrora, $userName!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FourthPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                    ),
                  ),
                  child: Text('Start'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Astrora'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Astrora Logo and Name
              Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue.shade100,
                    child: Icon(
                      Icons.star,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Astrora',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Chatbox area (wider version)
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // Adjust width (80% of screen width)
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 8,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today 2:45 PM",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Hi, how can I assist you today?",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Chat Input Section (wider version)
              Container(
                width: MediaQuery.of(context).size.width *
                    0.8, // Adjust width (80% of screen width)
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "Type your message...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        // Handle sending the message
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // Padding below the chat input
            ],
          ),
        ),
      ),
    );
  }
}
