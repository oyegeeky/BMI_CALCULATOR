import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),

    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var kg_controller = TextEditingController();
  var feet_controller = TextEditingController();
  var cm_controller = TextEditingController();
  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      body: Center(
        child: Container(

          child: Stack(
            children: [

              //BLACK_BASE_CONTAINER

              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 21, vertical: 120),
                  width: 350,
                  //height: 10,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      //LOGO_AND_TEXT'CALCULATOR'
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 100,
                            child:Image.asset('assets/images/bmi.png'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            height: 70,
                            width: 180,
                            child: Text('Calculator',
                              style: TextStyle(
                                  color: Colors.green.shade500,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30

                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 35,
                      ),

                      //WEIGHT_KGS_CALCULATOR
                      TextField(
                        controller: kg_controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.all(50),
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.green,
                          label: Text('Enter Weight in Kgs',
                            style: TextStyle(
                                color: Colors.green.shade400,
                                fontFamily: 'Poppins',
                                //fontWeight: FontWeight.w600,
                                fontSize: 20,
                            ),
                          ),
                          prefixIcon: Icon(Icons.line_weight_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      //HEIGHT_FEET
                      TextField(
                        controller: feet_controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(50),
                          filled: true,
                          fillColor: Colors.white,

                          label: Text('Enter Height in Feets',
                            style: TextStyle(
                                color: Colors.green.shade400,
                                fontFamily: 'Poppins',
                                //fontWeight: FontWeight.w600,
                                fontSize: 20
                            ),
                          ),
                          prefixIcon: Icon(Icons.line_weight_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      //HEIGHT_inches
                      TextField(
                        //keyboardType: ,
                        controller: cm_controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(50),
                          filled: true,
                          fillColor: Colors.white,
                          label: Text('Enter Height in Inches',
                            style: TextStyle(
                                color: Colors.green.shade400,
                                fontFamily: 'Poppins',
                                //fontWeight: FontWeight.w600,
                                fontSize: 20
                            ),
                          ),
                          prefixIcon: Icon(Icons.height_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      //CALCULATE_BUTTON
                      ElevatedButton(onPressed: (){

                        var wt = kg_controller.text.toString();
                        var h1 = feet_controller.text.toString();
                        var h11 = cm_controller.text.toString();


                        if(wt!='' && h1!='' && h11!='')
                        {

                          var kg = int.parse(wt);
                          var ft = int.parse(h1);
                          var inchs = int.parse(h11);

                          var toInches = ft*12 + inchs;
                          var toCm = toInches*2.54;
                          var toMetre = toCm/100;

                          var WT = int.parse(wt);

                          var BMI = WT/(toMetre*toMetre);




                          setState((){
                            if(BMI<18){
                              result = "Your BMI is ${BMI.toStringAsFixed(2)} \n You are KUPOSHAN" ;
                            }

                            else if( BMI < 25)
                              {
                                result = "Your BMI is ${BMI.toStringAsFixed(2)} \n You are Normal";
                              }
                            else
                            {
                              result = "Your BMI is ${BMI.toStringAsFixed(2)} \n You are MOTU";
                            }


                          });

                          //Calculate BMI
                        }
                        else {
                          (
                            setState((){
                              result = "Please fill all required blanks";
                            })
                          );
                        }
                        },
                          child: const Text('Calculate',
                        style: TextStyle(fontFamily: 'Poppins',
                            fontSize: 30
                        ),

                      )
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Text( '$result' , style: const TextStyle(fontSize: 20, color: Colors.orange),)

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}