
import 'package:flutter/material.dart';
import 'package:news_api/Article.dart';
import 'package:news_api/details.dart';
import 'api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// homepage class
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  String SportsURL= "https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=5764fa7bf6ec44e58df6bd1624781d9b";
  String HealthsURL="https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=5764fa7bf6ec44e58df6bd1624781d9b";
  String TechnologyURL="https://newsapi.org/v2/top-headlines?country=eg&category=technology&apiKey=5764fa7bf6ec44e58df6bd1624781d9b";
  String BusinessURL="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5764fa7bf6ec44e58df6bd1624781d9b";
  String EntertainmentURL="https://newsapi.org/v2/top-headlines?country=eg&category=entertainment&apiKey=5764fa7bf6ec44e58df6bd1624781d9b";
  // build function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {


            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(icon: Icon(Icons.health_and_safety_outlined), label: "Health"),
          NavigationDestination(icon: Icon(Icons.sports_tennis), label: "Sport"),
          NavigationDestination(icon: Icon(Icons.data_thresholding_outlined), label: "technology"),
          NavigationDestination(icon: Icon(Icons.business_sharp), label: "Business"),
          NavigationDestination(icon: Icon(Icons.games), label: "Entertainmen"),


        ],
      ),
      appBar: AppBar(title: Text('NewsApp'),)
      ,body: <Widget>[
      //Sports page

      //Science page

      Center(
        // FutureBuilder
        child: FutureBuilder<List<Article>>(
          future: API.getArticles(HealthsURL),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {

              final posts = snapshot.data!;
              print("object");
              return buildPosts(posts);
            } else {
              // if no data, show simple Text
              return const Text("No data available");
            }
          },
        ),
      ),
      Center(
        // FutureBuilder
        child: FutureBuilder<List<Article>>(
          future: API.getArticles(SportsURL),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {

              final posts = snapshot.data!;
              print("object");
              return buildPosts(posts);
            } else {
              // if no data, show simple Text
              return const Text("No data available");
            }
          },
        ),
      ),
      Center(
        // FutureBuilder
        child: FutureBuilder<List<Article>>(
          future: API.getArticles(TechnologyURL),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {

              final posts = snapshot.data!;
              print("object");
              return buildPosts(posts);
            } else {
              // if no data, show simple Text
              return const Text("No data available");
            }
          },
        ),
      ),
      Center(
        // FutureBuilder
        child: FutureBuilder<List<Article>>(
          future: API.getArticles(BusinessURL),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {

              final posts = snapshot.data!;
              print("object");
              return buildPosts(posts);
            } else {
              // if no data, show simple Text
              return const Text("No data available");
            }
          },
        ),
      ),
      Center(
        // FutureBuilder
        child: FutureBuilder<List<Article>>(
          future: API.getArticles(EntertainmentURL),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {

              final posts = snapshot.data!;
              print("object");
              return buildPosts(posts);
            } else {
              // if no data, show simple Text
              return const Text("No data available");
            }
          },
        ),
      ),
    ][currentPageIndex],
    );
  }

  // function to display fetched data on screen
  Widget buildPosts(List<Article> posts) {
    // ListView Builder to show data in a list
    return ListView.builder(
      itemCount: posts.length,

      itemBuilder: (context, index) {

        final artical = posts[index];
        print("____________");
        print(artical.runtimeType);
        print("____________");
        return
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  details(artical:artical)),
              );
            },
            child: Container(
            color: Colors.grey.shade300,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 100,
            width: double.maxFinite,
            child: Row(
              children: [
                if(artical.urlToImage!=null)
                Expanded(flex: 1, child: Image.network(artical.urlToImage!)),
                SizedBox(width: 10),
                Expanded(flex: 3, child: Text(artical.title!)),


              ],
            ),
                    ),
          );
      },
    );
  }
}