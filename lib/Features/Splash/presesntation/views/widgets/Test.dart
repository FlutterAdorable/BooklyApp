import 'package:booklyapp/Core/utils/assets.dart';
import 'package:flutter/material.dart';


class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network("https://i.imgur.com/p3CfZBS.png",
                  fit: BoxFit.cover),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              child: FutureBuilder(
                future: _getData(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return buildlink(
                          imageName: AssetsData.testImage,
                          page: 'Test',
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<LinkData>> _getData() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      LinkData(image: "https://i.imgur.com/p3CfZBS.png", title: 'First'),
      LinkData(image: "https://i.imgur.com/p3CfZBS.png", title: 'Second'),
      LinkData(image: "https://i.imgur.com/p3CfZBS.png", title: 'Third'),
    ];
  }

  Widget buildlink({required String imageName, required String page}) {
    return Card(
      child: Container(
        child: Text(page),
        height: 400,
      ),
    );
  }
}

class LinkData {
  const LinkData({
    required this.image,
    required this.title,
  });

  final String image;
  final String title;
}