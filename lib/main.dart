import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boat Shop Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Boat Shop Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child : Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.16,
                    child: Icon(Icons.filter_alt),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.84,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(top : 0.0),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index){
                        return SearchItem(boatType: "Boat Type $index", selected:false);
                      },
                    ),
                  ),
                ],
              )

            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.80,
              color: Colors.grey[100],
              child: ListView.builder(
                padding: EdgeInsets.only(top : 0.0),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.only(left :15.0, right: 15, top : 10, bottom:10 ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left :0.0, right: 0, top : 0, bottom:10 ),
                        child: Column(
                          children: [

                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                              ),
                              child:
                              CachedNetworkImage(
                                fit: BoxFit.contain,
                                width: MediaQuery.of(context).size.width,
                                // height: 200,
                                imageUrl: "https://d196r9c7cfkkpm.cloudfront.net/fotos/xlarge/455959-fb205d294070e58a08761a667fabc026-com.jpg",
                                placeholder: (context, url) => Center(child: Container(height:50, width: 50,child: CircularProgressIndicator())),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              )
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(top :10.0),
                                  child: Text(
                                    "Boat Name ${index+1}",
                                    style: TextStyle(
                                        color: Colors.amber[900],
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchItem extends StatefulWidget {

  final String boatType;
  final bool selected;


  SearchItem({this.boatType, this.selected});

  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {

  bool selection;
  String boatType = "";


  @override
  void initState() {
    super.initState();
    setState(() {
      selection = widget.selected;
      boatType = widget.boatType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: (){
          setState(() {
            selection = !selection;
          });
        },
        child: Container(
          height: 30,
          width: 120,
          decoration: BoxDecoration(
            color: selection ? Colors.blue[500] : Colors.lightBlue[100],
            borderRadius:
            BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left : 5.0),
                child: Text(boatType, style: TextStyle(color: Colors.blue[900]),),
              ),
              Padding(
                padding: const EdgeInsets.only(right : 5.0),
                child: Icon(Icons.close, color: Colors.blue[900],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
