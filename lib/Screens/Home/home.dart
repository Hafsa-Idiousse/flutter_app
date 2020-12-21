import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app3/Custom/popupMenu.dart';
import 'package:flutter_app3/Custom/widget.dart';
import 'package:flutter_app3/Screens/Auth/Authenticate.dart';
import 'package:flutter_app3/Screens/Home/drawer.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}
class Home extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<Home> with TickerProviderStateMixin {
  List<Widget> _tabs = [Text('LES + HOT'), Text('A LA UNE'), Text('HOT'),Text('NOUVEAUX'),Text('COMMENTES')];
  List<Widget> _tabsViews = [PlusHot(),Text('A LA UNE'), Text('HOT'),Text('NOUVEAUX'),Text('COMMENTES')];
  @override
  Widget build(BuildContext context) {
    TabController _tabController = new TabController(length: 5, vsync: this);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Tous les deals'),
          actions: [
            IconButton(icon: Icon(Icons.notifications), onPressed: (){}),
            IconButton(icon: Icon(Icons.search), onPressed: (){}),
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: _tabs,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _tabsViews,
        ),
        drawer: CustomDrawer(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            _tabController.animateTo(_tabController.index+1);
          },
          tooltip: 'Ajouter',
        ),
      ) ,

    );
  }
}
class PlusHot extends StatefulWidget {
  @override
  _PlusHotState createState() => _PlusHotState();
}

class _PlusHotState extends State<PlusHot> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference plusHotCollectionRef ;
  Stream<QuerySnapshot> plusHotCollectionStream ;

  @override
  void initState (){
    super.initState();
    plusHotCollectionRef = firestore.collection('deals');
    plusHotCollectionStream = plusHotCollectionRef.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: plusHotCollectionStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator()
            ),
          );
        }
        print(snapshot.data);
        List<Map<String,dynamic>> dealList = snapshot.data.docs.map((doc) => {
          'dealDescription': doc.get('dealDescription'),
          'commentsNumbr': doc.get('commentsNumbr'),
          'creationDate': doc.get('creationDate'),
          'dealPrice': doc.get('dealPrice'),
          'deliveryPrice': doc.get('deliveryPrice'),
          'discount': doc.get('discount'),
          'expiryDate': doc.get('expiryDate'),
          'heat': doc.get('heat'),
          'oldPrice': doc.get('oldPrice'),
          'store': doc.get('store'),
          'userName': doc.get('userName'),
        }).toList();
        print(dealList);
        return ListView.builder(
            itemCount: dealList.length,
            itemBuilder: (context, index){
              return CustomDealCard(dealList[index]);
            }
        );
      }
    );
  }
}
