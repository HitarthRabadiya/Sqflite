import 'package:flutter/material.dart';
import 'package:loginpg/data.dart';
class sample extends StatefulWidget {
  const sample({Key? key}) : super(key: key);

  @override
  State<sample> createState() => _sampleState();
}

class _sampleState extends State<sample> {
  List<Map> list = [];
  getdata() {
    dbclass.dbcreate().then((value) {
      String s = "select * from register";
      value.rawQuery(s).then((value) {
        print(value);
        setState(() {
          list = value;
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    Map m=ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pushReplacementNamed(context, "view");
        }, icon: Icon(Icons.arrow_back)),
        backgroundColor: Color(0xff112467),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),), title: Center(child: Text("Login page"),),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 4,color: Color(0xff112467)),
        ),
        child: Column(
          children: [
            Row(children: [
              IconButton(onPressed: () {
                Navigator.pushReplacementNamed(context, "first",arguments: m);
                Navigator.pushReplacementNamed(context, "first",arguments: m);
              }, icon: Icon(Icons.edit)),
              IconButton(onPressed: () {
                dbclass.dbcreate().then((value) {
                  String s = "delete from register where id=${m['id']}";
                  value.rawDelete(s).then((value) {
                    if (value == 1) {
                      getdata();
                      Navigator.pushReplacementNamed(context, "view");
                    }
                  });
                });
              }, icon: Icon(Icons.delete)),
            ],),
            SizedBox(height: 20,),
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black54,
                image: DecorationImage(
                  image: AssetImage("image/images1.png"),),
              ),
            ),
            SizedBox(height: 25),
            Container(
              alignment: Alignment.center,
              child: Text("Employ-Id : ${m['employid']}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 30,),
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Name : ${m['employName']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Contact : ${m['contact']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Email-Id : ${m['email']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Designation : ${m['designation']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Salary : ${m['salary']}₹",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Field : ${m['field']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}
