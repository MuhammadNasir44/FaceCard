



import 'package:face_card/core/constants/colors.dart';
import 'package:face_card/core/constants/style.dart';
import 'package:face_card/ui/screens/cashout/cash_out_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PurchaseZaps extends StatelessWidget {
  final List<Map> myProducts =
  List.generate(100, (index) => {"id": index, "name": "Product $index"})
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5C2CC8),
      bottomNavigationBar: Container(
        color:Colors.purple ,
        padding: EdgeInsets.only(top: 10),
        child: InkWell(
          onTap: () {
            print('Clicked...!');
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: purpleColor,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
                  'Get a million zaps',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff5C2CC8),
        title: Text(
          'PURCHASE ZAPS',
          style: TextStyle(fontSize: 20),
        ),
        automaticallyImplyLeading: false,

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration:gradients,
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 2, bottom: 5),
                    child: Container(
                        // height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(

                          //textAlign: TextAlign.start,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical:0 ),
                            border: OutlineInputBorder(),
                            hintText: 'Search million no. of zaps',
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.black54,
                            ),
                          ),
                        )),
                  ),
                ),
////ghg
                ///GridView Builder Container
                Container(
                  height: MediaQuery.of(context).size.height*0.75,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2.7 / 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 10),
                      itemCount: myProducts.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CashOutScreen()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/multiplezips.svg",
                                  height: 80,
                                ),
                                Text("500 ZAPS",style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}