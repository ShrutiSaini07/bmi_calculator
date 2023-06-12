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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var intController = TextEditingController();

  var result = "";
  var bgColor ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(
                    fontSize: 34 , fontWeight: FontWeight.w700
                ),),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in Kgs'),
                        prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in Feets'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: intController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in Inches'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = intController.text.toString();

                  if(wt!= "" && ft!= "" && inch!= ""){
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt*12)+ iInch;

                      var tCm = tInch*2.54;

                      var tM = tCm/100;

                      var bmi = iWt/(tM*tM);

                      var msg = "";

                      if(bmi>25){

                        msg = "You Are Over Weight!!";
                        bgColor = Colors.orange.shade200;

                      }else if(bmi<18){

                        msg = "You Are Under Weight!!";
                        bgColor = Colors.red.shade200;

                      }else{
                        msg = "You Are Healthy!!";
                        bgColor = Colors.green.shade200;
                  }

                      setState(() {
                        result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                      });

                  }else
                    {
                        setState(() {
                          result = "Please fill all the details correctly.";
                        });
                    }
                },

                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0)
                      ),
                      primary: Colors.blueAccent
                  ),
                  child: Text('Calculate',style: TextStyle(color: Colors.white),
                ),),

                SizedBox(
                  height: 11,
                ),
                Text(result ,style: TextStyle(fontSize: 20),),
              ]
            ),
          ),
        ),
      )
    );
  }
}
