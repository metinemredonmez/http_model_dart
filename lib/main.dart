import 'package:film_app/Films.dart';
import 'package:film_app/film_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Films>> getData() async {

    var filmslist = <Films>[];

    var f1 = Films(film_id: 1, film_name: "Anatolia", film_image_name: "anadoluda.png", film_price: 15.99);
    var f2 = Films(film_id: 2, film_name: "django", film_image_name: "django.png", film_price: 15.99);
    var f3 = Films(film_id: 3, film_name: "inception", film_image_name: "inception.png", film_price: 15.99);
    var f4 = Films(film_id: 4, film_name: "interstellar", film_image_name: "interstellar.png", film_price: 15.99);
    var f5 = Films(film_id: 5, film_name: "thehatefuleight", film_image_name: "thehatefuleight.png", film_price: 15.99);
    var f6 = Films(film_id: 5, film_name: "thepianist", film_image_name: "thepianist.png", film_price: 15.99);

    filmslist.add(f1);
    filmslist.add(f2);
    filmslist.add(f3);
    filmslist.add(f4);
    filmslist.add(f5);
    filmslist.add(f6);

    return filmslist;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Film App"),
      ),
      body: FutureBuilder<List<Films>> (
        future: getData(),
        builder: (context,snapshop){
          if(snapshop.hasData) {
            // getdata
            var filmslist =  snapshop.data;

            return GridView.builder(
                itemCount: filmslist!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.5,
                ),
              itemBuilder: (context,index) {
                  var film = filmslist[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context ,MaterialPageRoute(builder: (context)=>film_details(film: film,)));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset("images/${film.film_image_name}"),
                          ),
                          Text(film.film_name,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                          Text("${film.film_price} \u{20BA}",style: TextStyle(fontSize: 16.0,),),
                        ],
                      ),
                    ),
                  );
              },
            );

          }else {
            return Center();
          }
        },

      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
