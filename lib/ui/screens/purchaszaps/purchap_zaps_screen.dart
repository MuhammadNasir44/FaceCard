import 'package:face_card/core/constants/colors.dart';
import 'package:face_card/core/constants/style.dart';
import 'package:face_card/ui/screens/cashout/cash_out_screen.dart';
import 'package:face_card/ui/screens/sendZap/send_zaps_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PurchaseZaps extends StatelessWidget {
  final List<Map> myProducts =
      List.generate(100, (index) => {"id": index, "name": "Product $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:  Colors.purple,
      bottomNavigationBar: InkWell(
        onTap: () {
          print('Clicked...!');
        },
        child: Container(

          height: 70,
          margin: EdgeInsets.only(left: 25,right: 25,bottom: 10),
          decoration: BoxDecoration(
              color: purpleColor,

              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Get a million zaps & cash out ',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                          text: '1000\$',
                          style: TextStyle(
                              color: Color(0xffF2C921), fontSize: 18),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {

                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreens()));
                              // navigate to desired screen
                            }),
                    ]),
              ),),
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
            decoration: gradients,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                // Center(
                //   child: Padding(
                //     padding: EdgeInsets.only(top: 2, bottom: 5),
                //     child: Container(
                //         // height: MediaQuery.of(context).size.height * 0.05,
                //         width: MediaQuery.of(context).size.width * 0.9,
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(15),
                //         ),
                //         child: TextField(
                //           //textAlign: TextAlign.start,
                //           obscureText: true,
                //           decoration: InputDecoration(
                //             contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical:0 ),
                //             border: OutlineInputBorder(),
                //             hintText: 'Search million no. of zaps',
                //             suffixIcon: Icon(
                //               Icons.search,
                //               color: Colors.black54,
                //             ),
                //           ),
                //         ),
                //     ),
                //   ),
                // ),
////ghg
                ///GridView Builder Container
                Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 2.7 / 2,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 40),
                      itemCount: 6,
                      itemBuilder: (BuildContext ctx, index) {
                        var currentIndex = index + 1;
                        var sendZaps = currentIndex * 50;
                        var charges = currentIndex * 0.50;
                        return InkWell(
                          onTap: () {
                            addWeightBottomSheet(context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => SendZapsScreen(getZaps: sendZaps,)));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/multiplezips.svg",
                                  height: 80,
                                ),
                                Text(
                                  "${sendZaps} Zaps",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "\$ ${charges}",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
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

  ///
  /// add weight bottom sheet
  ///
  addWeightBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (context) {
        return  Padding(
          padding: EdgeInsets.only(right: 25, left: 25, bottom: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children:const [
              SizedBox(height: 20),
              Text(
                "Here will be payment process",
                style: TextStyle(fontSize: 16),),
              SizedBox(height: 20),
              SizedBox(height: 60),
              SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}
