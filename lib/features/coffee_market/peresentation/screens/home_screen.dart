import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: scaffoldKey, // Assign the GlobalKey to the Scaffold
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: Colors.amber[900],
              ),
              onPressed: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
            ),
          ],
          leading: IconButton(
            icon: Icon(
              Icons.menu, // Hamburger icon
              color: Colors.amber[900],
            ),
            onPressed: () {
              scaffoldKey.currentState
                  ?.openDrawer(); // Use GlobalKey to open the drawer
            },
          ),
        ),
        drawer: Drawer(
           child: Container(
      color: Colors.brown[900],
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green[700], // Customize the drawer header color
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://espressocoffeeguide.com/wp-content/uploads/honduras-green-coffees.jpg', // Replace with your image URL
                      height: 125,
                      width: 450, // Adjust width as needed
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    // ... other child widgets
                  ],
                ),
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.home,
                        color: Colors.white), // Add your desired icon
                    SizedBox(width: 10),
                    Text('Home',
                    style: TextStyle(
                    color: Colors.white, // Text color
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                  ),
                  ],
                ),
                onTap: () {
                  // Handle 'Bid' onTap
                },
                tileColor: Colors.brown, // Background color
              ),
              const Divider(),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.shopping_cart,
                        color: Colors.white), // Add your desired icon
                    SizedBox(width: 10),
                    Text('Bid',
                    style: TextStyle(
                    color: Colors.white, // Text color
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                  ),
                  ],
                ),
                onTap: () {
                  // Handle 'Bid' onTap
                },
                tileColor: Colors.brown, // Background color
              ),
              const Divider(),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.category,
                        color: Colors.white), // Add your desired icon
                    SizedBox(width: 10),
                    Text('Speciality',
                    style: TextStyle(
                    color: Colors.white, // Text color
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                  ),
                  ],
                ),
                onTap: () {
                  // Handle 'Speciality' onTap
                },
                tileColor: Colors.brown,
              ),
              const Divider(),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.shopping_bag,
                        color: Colors.white),
                    SizedBox(width: 10),
                    Text('Shop',
                    style: TextStyle(
                    color: Colors.white, // Text color
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                    ),
                  ],
                ),
                onTap: () {
                },
                tileColor: Colors.brown,
              ),
              const Divider(),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.connect_without_contact,
                        color: Colors.white),
                    SizedBox(width: 10),
                    Text('Connect',
                    style: TextStyle(
                    color: Colors.white, // Text color
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                  ),
                  ],
                ),
                onTap: () {
                },
                tileColor: Colors.white,
              ),
            ],
          ),
        ),
        ),
        body: LiquidPullToRefresh(
          onRefresh: () async {
            await _handleRefresh();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Refresh completed'),
              ),
            );
          },
          color: Colors.black87,
          height: 100,
          backgroundColor: Colors.green[300],
          animSpeedFactor: 2,
          showChildOpacityTransition: false,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      isDarkMode ? Colors.black87 : Colors.grey,
                      isDarkMode ? Colors.black87 : Colors.white,
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 109.0),
                    child: Center(
                      child: Card(
                        elevation: 0.0,
                        color: isDarkMode ? Colors.black : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                            color: Colors.amber.shade900,
                            width: 1.2,
                          ),
                        ),
                        child: Container(
                          height: 103,
                          width: 350,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 50.0),
                                    child: Icon(
                                      Icons.coffee,
                                      size: 50.0,
                                      color: Colors.brown,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Coffee Market",
                                          style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                            color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "Dive into the coffee world",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                            color: isDarkMode
                                                ? Colors.grey
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Card(
                      elevation: 0.0,
                      color: isDarkMode ? Colors.black : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 1.2,
                        ),
                      ),
                      child: Container(
                        height: 195,
                        width: 350,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 50.0),
                                  child: Icon(
                                    Icons.show_chart,
                                    size: 50.0,
                                    color: Colors.brown,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Daily Trade Data",
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "today's result... ",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                          color: isDarkMode
                                              ? Colors.grey
                                              : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 68.0, left: 12, right: 12),
                        child: Card(
                          elevation: 0.0,
                          color: isDarkMode ? Colors.black : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 50, 49, 51),
                              width: 1,
                            ),
                          ),
                          child: Container(
                            height: 120,
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.send,
                                  size: 30.0,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "Exporters",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 68.0, left: 12, right: 12),
                        child: Card(
                          elevation: 0.0,
                          color: isDarkMode ? Colors.black : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(
                              color: Color.fromRGBO(13, 71, 161, 1),
                              width: 1.2,
                            ),
                          ),
                          child: Container(
                            height: 120, // Adjust the height as needed
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.business_center,
                                  size: 30.0,
                                  color: Colors.green,
                                ),
                                Text(
                                  "Provider",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 68.0, left: 12, right: 12),
                        child: Card(
                          elevation: 0.0,
                          color: isDarkMode ? Colors.black : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                              color: Colors.purple.shade900,
                              width: 1,
                            ),
                          ),
                          child: Container(
                            height: 120,
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.send,
                                  size: 30.0,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "Exporters",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 68.0, left: 12, right: 12),
                        child: Card(
                          elevation: 0.0,
                          color: isDarkMode ? Colors.black : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(
                              color: Color.fromRGBO(13, 71, 161, 1),
                              width: 1.2,
                            ),
                          ),
                          child: Container(
                            height: 120, // Adjust the height as needed
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.business_center,
                                  size: 30.0,
                                  color: Colors.green,
                                ),
                                Text(
                                  "Provider",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 80.0, left: 16.0),
                child: Text(
                  "ቡና",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
