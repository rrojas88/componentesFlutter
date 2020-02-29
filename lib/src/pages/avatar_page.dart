import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage('https://assets.wemystic.com/wmcom/2018/10/santa-barbara-protectora-rayos-tormentas-850x640.jpg'),
                radius: 25.0,
              ),
          ),
          Container(
            margin: EdgeInsets.only( right: 10.0),
            child: CircleAvatar(
              child: Text('Rob'),
              backgroundColor: Colors.green,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ4MGLPb4Y7TGPMm8dSTEbcu2bDzdig3LWw7Tr2p2XF4MIihIfc'),
          placeholder: AssetImage('assets/073 jar-loading.gif'), 
        ),
      ),
      
    );
  }
}



