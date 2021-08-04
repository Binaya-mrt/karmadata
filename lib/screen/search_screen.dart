import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Search For Poofessional",
                  prefixIcon: Icon(Icons.search_outlined),
                  border: InputBorder.none),
            ),
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              crossAxisCount: 1,
              childAspectRatio: 4 / 5,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Card(
                  semanticContainer: false,
                  borderOnForeground: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            foregroundImage:
                                AssetImage('assets/images/binaya.jpg'),
                          ),
                          Column(
                            children: [
                              Text(
                                'Rs 400',
                                style: TextStyle(fontSize: 30),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 30,
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'Binaya',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        '10 KM away',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        'Electrician',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Heed not the rabble'),
                  color: Colors.teal[200],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
