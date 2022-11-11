import 'package:film_app/Films.dart';
import 'package:flutter/material.dart';

class film_details extends StatefulWidget {
  //film class
  Films film;
  //const
  film_details({required this.film});

  @override
  State<film_details> createState() => _film_detailsState();
}

class _film_detailsState extends State<film_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.film_name),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("images/${widget.film.film_image_name}"),
              Text("${widget.film.film_name}\u{20BA}",style: TextStyle(fontSize: 24.0,),),
              Text("${widget.film.film_price}\u{20BA}",style: TextStyle(fontSize: 24.0,),),

              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: Text("Rent"),
                  onPressed: () {
                    print("${widget.film.film_name} rented");
                  },
                ),
              )
            ],
          ),
      ),
    );
  }
}
