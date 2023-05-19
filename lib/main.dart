import 'package:flutter/material.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // if (Platform.isMacOS) {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Hide the native title bar
    // SystemChrome.setEnabledSystemUIOverlays([]);
    const customTextStyle = TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white);
    return MaterialApp(
        title: 'ResponsiveLayout',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const TwoColumnLayout());
  }
}

@override
Widget build(BuildContext context) {
  const customTextStyle = TextStyle(
      fontFamily: 'Inter',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white);

  return Scaffold(
      body: Container(
          color: const Color(0xfff5f5f5), // Set the background color here
          child: Row(children: [
            Container(
              width: 260,
              color: Colors.deepPurple[300],
            ),
            SizedBox(
              height:
                  MediaQuery.of(context).size.height, // Set the desired height
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.deepPurple[400],
                    pinned: true,
                    expandedHeight: 60,
                    flexibleSpace: const FlexibleSpaceBar(
                      title: Text(
                        'Route',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SliverGrid.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5, // Adjust the aspect ratio as needed
                    children: List.generate(
                      20,
                      (index) => Container(
                        margin: const EdgeInsets.all(30),
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            'Item ${index + 1}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ])));
}

class TwoColumnLayout extends StatelessWidget {
  const TwoColumnLayout({super.key});

  @override
  Widget build(BuildContext context) {
    const customTextStyle = TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white);
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 260,
            decoration: BoxDecoration(
              color: Colors.grey[300], // Sidebar color
              border: const Border(
                right: BorderSide(
                  color: Colors.grey, // Border color
                  width: 1.0, // Border width
                ),
              ),
            ),
            child: const Sidebar(),
          ),
          Expanded(
            child: Column(
              children: [
                const Header(),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: CustomScrollView(
                    slivers: [
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 30,
                            ),
                            child: GridItem(index),
                          ),
                          childCount: 20,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 600,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                          childAspectRatio: 1.5,
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // Sidebar content
        );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[300], // Sidebar color
        border: const Border(
          bottom: BorderSide(
            color: Colors.grey, // Border color
            width: 1.0, // Border width
          ),
        ),
      ),
      child: const Center(
        child: Text(
          'Route Name',
          style: TextStyle(
              fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final int index;

  const GridItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Grid item color
      child: Center(
        child: Text(
          'Item ${index + 1}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
