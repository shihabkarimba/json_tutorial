import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:json_tutorial/details_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  Future<List<dynamic>> getData() async {
    var response = await get(Uri.parse("https://reqres.in/api/users?page=2"));
    var decodedData = jsonDecode(response.body);
    return decodedData['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
          future: getData(),
          builder: (context, snapShot) {
            //connection state -> done
            if (snapShot.connectionState == ConnectionState.done) {
              if (snapShot.hasData) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final _data = snapShot.data![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                image: _data['avatar'],
                                name: _data['first_name'],
                                email: _data['email']),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            title: Text(_data['first_name']),
                            subtitle: Text(_data['email']),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(_data['avatar']),
                            ),
                            tileColor: Colors.yellow,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: snapShot.data!.length,
                );
              } else if (snapShot.hasError) {
                return const Center(
                  child: Text(
                      'Please confirm you have proper internet connection'),
                );
              }
            }
            //waiting or none
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    ));
  }
}
