import 'package:exercicewidget/main_title_text.dart';
import 'package:exercicewidget/post.dart';
import 'package:exercicewidget/post.dart';
import 'package:exercicewidget/section_title_text.dart';

import 'post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: ExercicePage(),
    );
  }
}

class ExercicePage extends StatelessWidget {

  List<Post> posts = [
    Post(name: "Elisee Azonsi", time: "5 minutes", imagePath: "images/beach.jpg", desc: "j'aime trop le coucher du soleil"),
    Post(name: "Elisee Azonsi", time: "5 minutes", imagePath: "images/nature-pont2.jpg", desc: "j'aime trop le coucher du soleil"),
    Post(name: "Elisee Azonsi", time: "5 minutes", imagePath: "images/beach.jpg", desc: "j'aime trop le coucher du soleil"),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    print("size: $size");
    print("platform: $platform");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Basics",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
          child:SingleChildScrollView(
              child: Column(
                  children: [
                  SingleChildScrollView(),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'images/nature-pont2.jpg',
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:140),
                    child:profilepic(65),
                  ),
                ],
              ),
              Row(
                children: [
                  Spacer(),
                  MainTitleText(data: "Elisee"),
                  Spacer()
                ],
              ),
              Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "À quoi sert-il à l'homme de gagner le monde entier "
                          "\n si c'est au prix de sa vie?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ]

              ),
              Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 330,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(20)
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Modifier le profil",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ) ,
                    Spacer(flex: 1,),
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(20)
                          )
                      ),
                      child: Row(

                          children: [
                            Icon(
                              Icons.mode,
                              color: Colors.white,
                            )
                          ]
                      ),
                    )
                  ]
              ),


              Stack(
                children:[
                  SectionTitle("À propos de moi"),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 5, top: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.home_outlined,
                        ),
                        Text(
                            "Luxembourg Luxembourg")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                        ),
                        Text(
                            "Developper FullStack")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                        ),
                        Text(
                            "Célibataire")
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top:10),
                      alignment: Alignment.centerLeft,
                      child:SectionTitle("Amis"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          child: ClipRRect(
                            child:Column(
                              children: [
                                Image.asset(
                                  'images/sonorix.jpg',
                                  height: 150,
                                  width: 125,
                                  fit: BoxFit.cover,
                                ),
                                Text("Isabelle"),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),


                        ),
                        Card(
                          child: ClipRRect(
                            child:Column(
                              children: [
                                Image.asset(
                                  'images/sonorix.jpg',
                                  height: 150,
                                  width: 125,
                                  fit: BoxFit.cover,
                                ),
                                Text("Isabelle"),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),

                        ),
                        Card(
                          child: ClipRRect(
                            child:Column(
                              children: [
                                Image.asset(
                                  'images/sonorix.jpg',
                                  height: 150,
                                  width: 125,
                                  fit: BoxFit.cover,
                                ),
                                Text("Isabelle"),
                              ]
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 2,),
                    SectionTitle("Mes Post"),
                    allPost()


                  ],

                ),
              )
            ]
          ),
              Container(

              )

          ]

      )

    ),
    ),


    );



  }

  Column allPost(){
    List<Widget> postToAdd = [];
    posts.forEach((element) {
      postToAdd.add(post(post: element));
    });
    return Column(children: postToAdd,);
  }

  CircleAvatar profilepic(double radius){
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: radius-5,
        backgroundImage: AssetImage("images/beach.jpg"),
      ),


    );
  }

  Container titleText(String text){
    return Container(
      alignment: Alignment.centerLeft,
      child:Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container post({ required Post post}){
    return Container(
      margin: EdgeInsets.only(top: 8, left: 3, right: 3),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              profilepic(20),
              Padding(padding: EdgeInsets.only(left: 8)),
              Text(post.name),
              Spacer(),
              timeText(post.setTime())
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Image.asset(post.imagePath, fit: BoxFit.cover,)
          ),
          Text(post.desc,
            style: TextStyle(
                color: Colors.blueAccent),
            textAlign: TextAlign.center,

          ),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite),
              Text(post.setLikes()),
              Icon(Icons.message),
              Text(post.setComments())
            ],
          )

        ],
      ),
    );
  }

  Text simpleText(text, double fontsize){
    return Text(
      text,
      style: TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: fontsize,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),

    );

  }

  Text timeText(String time) {
    return Text("Il y a $time", style: TextStyle(color: Colors.blue),);
  }
}

