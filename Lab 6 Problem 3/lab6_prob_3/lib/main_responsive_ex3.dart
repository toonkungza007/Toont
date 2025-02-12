import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsFeedScreen(),
    );
  }
}

class NewsFeedScreen extends StatelessWidget {
  final List<Map<String, String>> articles = [
    {
      'title': 'Introduction to Flutter',
      'description': 'Learn the basics of Flutter development...',
      'date': '2024-01-05',
      'readTime': '5 min read',
    },
    {
      'title': 'Advanced Widget Patterns',
      'description': 'Discover advanced patterns in Flutter...',
      'date': '2024-01-04',
      'readTime': '8 min read',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: orientation == Orientation.portrait
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article['title']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[700],
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          article['description']!,
                          style: TextStyle(color: Colors.black87),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              article['date']!,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Text(
                              article['readTime']!,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article['title']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[700],
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                article['description']!,
                                style: TextStyle(color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              article['date']!,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Text(
                              article['readTime']!,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
