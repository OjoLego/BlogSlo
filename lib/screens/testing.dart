import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//this file is for the purpose of testing another restAPI to see if it works
class APICall extends StatelessWidget {
  Future<List<dynamic>> fetchApi() async {
    try {
      var request =
      http.Request('GET', Uri.parse('https://fakestoreapi.com/products'));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print('API call successful');
        String responseBody = await response.stream.bytesToString();
        return jsonDecode(responseBody);
      } else {
        throw Exception('Failed to fetch data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchApi(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return Card(
            child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title: Text('${snapshot.data![index]['title']}'),
                    subtitle: Text('${snapshot.data![index]['description']}'),
                  );
                }),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

// https://fakestoreapi.com/products
// https://activeapis.site/api/allpost