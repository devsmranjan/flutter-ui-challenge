import 'package:flutter/material.dart';

const String appName = "Coaching";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.green,
          fontFamily: "Poppins"),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Color _primaryColor;
  Color _accentColor;

  @override
  Widget build(BuildContext context) {
    _primaryColor = Theme.of(context).primaryColor;
    _accentColor = Theme.of(context).accentColor;

    return Scaffold(
      appBar: AppBar(
        title: FlutterLogo(
          colors: Theme.of(context).accentColor,
        ),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        actions: <Widget>[IconButton(icon: Icon(Icons.menu), onPressed: () {})],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return new Column(
      children: <Widget>[
        Stack(
          children: <Widget>[_titleContainer(), _accountContainer()],
        ),
        Flexible(
          child: _coachContainer(),
        ),
      ],
    );
  }

  Widget _titleContainer() {
    return Container(
      height: 100.0,
      color: _primaryColor,
      padding: EdgeInsets.only(bottom: 48.0),
      child: Center(
        child: Text(
          "Get Coaching",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _accountContainer() {
    return Container(
      margin: EdgeInsets.only(left: 24.0, right: 24.0, top: 64.0, bottom: 32.0),
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
          color: _primaryColor,
          boxShadow: [BoxShadow(blurRadius: 1.0)],
          borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "YOU HAVE",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: <Widget>[
                    Text("206",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 40.0)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: FlatButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                splashColor: Colors.white70,
                highlightColor: Colors.white12,
                color: Colors.green[100],
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: _accentColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget _coachContainer() {
    return new Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "MY COACHES",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "VIEW PAST SESSIONS",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: _accentColor),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 18.0,
        ),
        Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: new GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: 0.6,
                shrinkWrap: true,
                children: <Widget>[
                  _buildCoachCard("https://media.nbcchicago.com/images/652*489/092310MarkZuckerberg01.jpg", "Alyx", "Available for the next 2 hours", true),
                  _buildCoachCard("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRzCMpne7qmm5RgyNSMhAvEwl-6kBrtgySn_3-kKiMZSMWiq9G6w", "Francisco", "Available for the next 5 hours", false),
                  _buildCoachCard("https://www.pureconcepts.com.mt/wp-content/uploads/2017/04/person-4.jpg", "Megon", "Available for the next 3 hours", false),
                  _buildCoachCard("https://cdn1.thr.com/sites/default/files/2017/08/gettyimages-630421358_-_h_2017.jpg", "James", "Available for the next 4 hours", true),
                ],
              ),
            ))
      ],
    );
  }

  Widget _buildCoachCard(String imgUrl, String name, String available, bool isOnline) {
    return new Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: _primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 36.0,),
          Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 48.0,
                backgroundImage: NetworkImage(imgUrl),
              ),
              Positioned(
                right: 4.0,
                child: Container(
                  height: 24.0,
                  width: 24.0,
                  decoration: BoxDecoration(
                      color: isOnline?Colors.green: Colors.orange,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.white, width: 4.0)
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              name,
              style:
              TextStyle(fontWeight: FontWeight.w600, fontSize: 24.0),
            ),
          ),SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              available,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey
              ),
            ),
          ),
          SizedBox(height: 18.0,),
          Expanded(
            child: isOnline ? Container(
              decoration: BoxDecoration(
                  color: _accentColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  )
              ),
              child: Center(
                child: Text("Request", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600
                ),),
              ),
            ): new Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  )
              ),
              child: Center(
                child: Text("Request", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }

}
