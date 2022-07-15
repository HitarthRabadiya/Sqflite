import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:loginpg/data.dart';
import 'package:loginpg/view.dart';
import 'package:loginpg/view2.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "first":(context)=>first(),
      "view":(context)=>view(),
      "sample":(context)=>sample()
    },initialRoute: "first",
  ));
}

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}
class _firstState extends State<first> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  TextEditingController t5 = TextEditingController();
  TextEditingController t6 = TextEditingController();
  TextEditingController t7 = TextEditingController();
  Map map=Map();
  List<Map> list=[];
  getdata()
  {
    dbclass.dbcreate().then((value) {
      String s="select * from register";
      value.rawQuery(s).then((value) {
        print(value);
        setState(() {
          list=value;
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
    dynamic m=ModalRoute.of(context)!.settings.arguments;
    if(m!=null)
    {
      map=m;
      t1.text=map['employid'];
      t2.text=map['employName'];
      t3.text=map['designation'];
      t4.text=map['salary'];
      t5.text=map['field'];
      t6.text=map['email'];
      t7.text=map['contact'];
      print(map);
    }
    final _formKey = new GlobalKey<FormState>();

    void validateAndSave(){
      final form = _formKey.currentState;
      if(form!.validate())
      {
        print ('Form is valid');
      }
      else
      {
        print('form is invalid');
      }
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            Navigator.pushReplacementNamed(context, "view");
          }, icon: Icon(Icons.arrow_forward))
        ],
        backgroundColor: Color(0xff112467),
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
    ),), title: Center(child: Text("Login page"),),
      ),
      body: SingleChildScrollView(child: Container(
        child: Form(
          key: _formKey,
            child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 7,right: 8,bottom: 5,top: 5),
              child: TextFormField(
                validator: (value) {
                  if(value!.isEmpty || !RegExp(r'[0-9]').hasMatch(value))
                    {
                      return "Enter currect Number";
                    }
                  else
                    {
                      return null;
                    }
                },
                  obscureText: false,
                  controller: t1,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      labelText: " Employ-Id ",
                      hintText:"Employ-Id",
                      labelStyle: TextStyle(fontSize: 18,color: Colors.black),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Color(0xff112467))))),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 7,right: 8,bottom: 5,top: 5),
              child: TextFormField(
                  validator: (value) {
                    if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                    {
                      return "Enter currect Number";
                    }
                    else
                    {
                      return null;
                    }
                  },
                  controller: t2,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: " EmployName ",
                      hintText:"EmployName",
                      labelStyle: TextStyle(fontSize: 18,color: Colors.black),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Color(0xff112467)))
                  )),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 7,right: 8,bottom: 5,top: 5),
              child: TextFormField(
                  validator: (value) {
                    if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value))
                    {
                      return "Enter currect emailId";
                    }
                    else
                    {
                      return null;
                    }
                  },
                  controller: t6,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: " email Id ",
                      hintText:"email Id",
                      labelStyle: TextStyle(fontSize: 18,color: Colors.black),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Color(0xff112467)))
                  )),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 7,right: 8,bottom: 5,top: 5),
              child: TextFormField(
                  validator: (value) {
                    if(value!.isEmpty || !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(value))
                    {
                      return "Enter currect ContactNo.";
                    }
                    else
                    {
                      return null;
                    }
                  },
                  controller: t7,
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      labelText: " Contact No. ",
                      hintText:"Contact No.",
                      labelStyle: TextStyle(fontSize: 18,color: Colors.black),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Color(0xff112467)))
                  )),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 7,right: 8,bottom: 5,top: 5),
              child: TextFormField(
                  validator: (value) {
                    if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                    {
                      return "Enter currect Designation";
                    }
                    else
                    {
                      return null;
                    }
                  },
                  controller: t3,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                  ],
                  decoration: InputDecoration(
                      labelText: " Designation ",
                      hintText:"Designaton",
                      labelStyle: TextStyle(fontSize: 18,color: Colors.black),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Color(0xff112467)))
                  )),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 7,right: 8,bottom: 5,top: 5),
              child: TextFormField(
                  validator: (value) {
                    if(value!.isEmpty || !RegExp(r'[0-9]').hasMatch(value))
                    {
                      return "Enter currect Salary";
                    }
                    else
                    {
                      return null;
                    }
                  },
                  controller: t4,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      labelText: " Salary ",
                      hintText:"Salary",
                      labelStyle: TextStyle(fontSize: 18,color: Colors.black),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Color(0xff112467)))
                  )),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 7,right: 8,bottom: 5,top: 5),
              child: TextFormField(
                  validator: (value) {
                    if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                    {
                      return "Enter currect FeildName";
                    }
                    else
                    {
                      return null;
                    }
                  },
                  controller: t5,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: " Feild ",
                      hintText:"Feild",
                      labelStyle: TextStyle(fontSize: 18,color: Colors.black),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderSide :BorderSide(color: Color(0xff112467)))
                  )),
            ),
            SizedBox(height: 30),
            GFButton(
              onPressed: (){
                print(validateAndSave);
                String a=t1.text;
                String b=t2.text;
                String c=t3.text;
                String d=t4.text;
                String e=t5.text;
                String f=t6.text;
                String g=t7.text;
                dbclass.dbcreate().then((value) {
                  if(m==null){
                    if(_formKey.currentState!.validate())
                      {
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   content: Text("error",textAlign: TextAlign.center,),
                        // ));
                      }
                        if(t1.text!="" && t2.text!="" && t3.text!="" && t4.text!="" && t5.text!="" && t6.text!="" && t7.text!="")
                          {
                            String q="insert into register(employid,employName,designation,salary,field,email,contact) values ('$a','$b','$c','$d','$e','$f','$g')";
                            value.rawInsert(q).then((value) {
                              if(value>=1)
                              {
                                print("Data Inserted");
                                Navigator.pushReplacementNamed(context,"view");
                              }
                            });
                          }
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("error",textAlign: TextAlign.center,),
                            ));
                          }
                      }
                  else
                  {
                    String q="update register set employid='$a',employName='$b',designation='$c',salary='$d',field='$e',email='$f',contact='$g' where id=${map['id']}";
                    value.rawUpdate(q).then((value) {
                      if(value==1)
                      {
                        print("Data updated");
                        Navigator.pushReplacementNamed(context, "sample");
                      }
                    });
                  }
                });
              },
              text: m==null?"Save":"Update",
              blockButton: true,
              color: Color(0xff112467),
            ),
          ],
        )),
      ),),
    );
  }
}
/*

*/
