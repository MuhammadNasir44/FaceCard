import 'package:face_card/core/constants/style.dart';
import 'package:face_card/ui/screens/ziprequests/zip_request_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/models/appusers_model.dart';
import '../widgets/search_bar.dart';

class TopZapper extends StatelessWidget {
  const TopZapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: gradients,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color(0xff5C2CC8),
          elevation: 0,
          title: Text('Top Zapper'),
          leading: Icon(Icons.arrow_back_ios_new),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Icon(
                  Icons.border_all_sharp,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchBar(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: personList.length,
                itemBuilder: (context, index) {
                  final currentPerson = personList[index];
                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ZipRequests()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('images/person.jpg'),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 2, bottom: 2),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(currentPerson.title,style: TextStyle(fontWeight: FontWeight.bold),),
                                            Text(currentPerson.subtile,style: TextStyle(color: Colors.grey),),

                                          ],
                                        ),

                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/logo.svg",
                                              width: 10,
                                            ),
                                            Text("7000"),

                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          right: 20,
                          bottom: 0,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color:Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(60)),
                            child: Center(
                              child: IconButton(
                                icon: Center(
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                                onPressed: () {},

                                padding: EdgeInsets.all(0),
                              ),
                            ),
                          )),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
