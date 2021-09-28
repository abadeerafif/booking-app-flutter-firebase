import 'package:booking_app/services/auth.dart';
import 'package:booking_app/services/properties_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:booking_app/screens/datapages/property_tile.dart';

class PropsList extends StatefulWidget {
  const PropsList({Key? key}) : super(key: key);

  @override
  _PropsListState createState() => _PropsListState();
}

class _PropsListState extends State<PropsList> {
  List<Properties> propsOnSearch=[];
  List<Properties> props=[
    Properties(ownerName:'Peter George', propID:1, propName:'Beit el Wadi', location:'Wadi El natroon'),
    Properties(ownerName:'Peter Magdy', propID:2, propName:'Beit el Salam', location:'Agamy'),
    Properties(ownerName:'Abadeer Afif', propID:3, propName:'Beit el Merryland', location:'Obour'),
    Properties(ownerName:'Kareem', propID:4, propName:'Beit Sam3an el Kharaz', location:'Wadi El natroon'),
  ];

  final AuthService _auth=AuthService();
  TextEditingController? _textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final properties=Provider.of<List<Properties>>(context);

    // return ListView.builder(
    //   itemCount: properties.length,
    //   itemBuilder: (context,index){
    //     return PropertyTile(props: properties[index]);
    //   },
    // );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Container(
            decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(30)),
            child: TextField(
              onChanged: (value){
                setState(() {

                });
              },
              controller: _textEditingController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: 'Search...'
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(onPressed: (){
              propsOnSearch.clear();
              _textEditingController!.clear();
              setState(() {
                _textEditingController!.text='';
              });
            },
                child: Icon(Icons.close,color: Colors.black,)),
            FlatButton.icon(
              onPressed: ()async{
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.person,color: Colors.white,),
              label: Text('Logout'),
              textColor: Colors.white,
            ),
          ],
        ),
         body: //_textEditingController!.text.isNotEmpty&&propsOnSearch.isEmpty?
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Icon(Icons.search_off,size: 90.0,),
        //         Text(
        //           'No results found',
        //           style: TextStyle(
        //             fontSize: 32.0,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ):
        ListView.builder(
          itemCount: props.length,
          itemBuilder: (context,index){
            return PropertyTile(props: props[index]);
          },
        )
    );
  }
}
