import 'package:flutter/material.dart';
import 'package:loginpg/data.dart';

class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff112467),
        title: Center(child: Text("view page"),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          Map m = list[index];
        return InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, "sample",arguments: m);
          },
          child: Container(
            margin: EdgeInsets.all(8),
            height: 180,width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[200],borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                Expanded(flex: 1,child: Column(
                  children: [
                    Expanded(flex: 1,child: Container()),
                    Expanded(flex: 1,child: Container(
                      height: 60,
                      width: 60,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black54,
                        image: DecorationImage(
                          image: AssetImage("image/images1.png"),),
                      ),
                    ),),
                    Expanded(flex: 1,child: Container()),
                  ],
                )),
                Expanded(flex: 3,child: Column(
                  children: [
                    Expanded(flex: 1,child: Container()),
                    Expanded(flex: 1,child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text("Name : ${m['employName']}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text("(${m['field']})",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,
                              color: Colors.black45),),
                        ),
                      ],
                    )),
                    Expanded(flex: 1,child: Container()),
                  ],
                )),
                Expanded(flex: 2,child: Column(
                  children: [
                    Expanded(flex: 1,child: Container(
                      alignment: Alignment.topRight,
                      child: Text("Id : ${m['employid']}",style: TextStyle(fontSize: 18,color: Colors.black54),),
                    )),
                    Expanded(flex: 1,child: Container(
                      alignment: Alignment.centerRight,
                      child: Text("${m['designation']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                    )),
                    Expanded(flex: 1,child: Container(
                      alignment: Alignment.centerRight,
                      child: Text("₹ : ${m['salary']}",style: TextStyle(color: Colors.black54),),
                    )),
                  ],
                )),
              ],
            ),
          ),);
      },),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff112467),
        onPressed: () {
          Navigator.pushReplacementNamed(context,"first");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
