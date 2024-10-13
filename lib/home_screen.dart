import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:quotes_app/second_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen(String s, {super.key});

  Future<Map<String, String>> fetchQuote() async{
    var url = Uri.parse(
        'https://dummyjson.com/quotes');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      // Fetching the quote and author from the JSON response
      String quote = data["quotes"][1]["quote"];
      String author = data["quotes"][1]["author"];

      return {"quote": quote, "author": author};
    } else {
      throw Exception('Failed to load quotes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
           child:  ElevatedButton(
                onPressed: () async{
                  try{

                    var quoteData = await fetchQuote();


                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(
                          quoteText: quoteData['quote']!,
                          authorName: quoteData['author']!,
                        ),
                      ),
                    );
                  } catch (e) {
                    print("Error fetching quotes: $e");
                  }



                }, child: Text("Get Quote")
            ),

          )
        )


    );
  }
}
