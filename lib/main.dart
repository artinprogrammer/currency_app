import 'package:cryptocurrency/mainPage.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children : [ Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.7,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/cryptopic.png"),
                    fit: BoxFit.fitHeight),
              ),
            ),
            Container(
              height: 150,
              child: Flexible(
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(40,10,0,0),
                      child: Text("Track your cryptocurrency portfolio in real time",style: TextStyle(fontSize: 35,color: Color.fromARGB(255, 112, 112, 112)),),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage()));
                    },
                     child: Text("Get started",style: TextStyle(color: Color.fromARGB(255, 12, 164, 253),fontSize: 25,),)
                    ),
                ],
              ),
            ),
          ],
        ),
        ],
      ),
    );
  }
}
