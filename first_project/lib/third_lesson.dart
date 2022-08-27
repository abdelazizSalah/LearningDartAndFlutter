import 'package:flutter/material.dart';

void main() {
  runApp(ThirdLesson());
}

class ThirdLesson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BackGroundAssetImage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(), // da el header bta3 el application el hwa byb2a fo2 keda
      drawer:
          Drawer(), // el hya el list el 3l shmal el bndos 3leha 34an nla2y gowa settings w profile w el klam da
      body: Container(
        // color: Colors.lightBlue,
        width: double
            .infinity, // ehna bn3ml keda lw 3auzen enna n5leh yakhud 7agm el shasha kolha
        height: 100,
        child: Text(
          "This is a new Container in which we insert data",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),

        margin: EdgeInsets.only(
            left: 10,
            right: 15,
            top: 20,
            bottom:
                50), // de aktur wahda fehom bt2dr tt7km feha , w mn ahsnhom fa hawl dayman test5dmha
        padding: EdgeInsets.only(left: 10, right: 5),
        decoration: BoxDecoration(
          color: Colors.blueAccent, // da lon el box nfso msh el text
          border: Border.all(
              color: Colors.blueGrey, width: 10, style: BorderStyle.solid),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              topRight: Radius.circular(
                  40)), // de 3n tre2ha b2dr a5ly el container 3la shkl oven bdl el rectange
          // borderRadius: BorderRadius.circular(20),  // 34an tst5dmha lazm tkon 3aml uniform boarder el hwa -> all
        ),
      ),
    );
  }
}

class BackGroundNetworkImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        child: Text(
          "New String",
          style: TextStyle(
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.redAccent,
                  blurRadius: 10,
                  offset: Offset(10, 20),
                )
              ],
              fontSize: 20,
              backgroundColor: Colors.teal),
        ),
        height: 300,
        width: 300,
        margin: EdgeInsets.all(40),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit
                .cover, // de bt5ly el sora tkhud el msa7a bta3t el sora kolaaha
            image: NetworkImage(
                'https://play-lh.googleusercontent.com/aFWiT2lTa9CYBpyPjfgfNHd0r5puwKRGj2rHpdPTNrz2N9LXgN_MbLjePd1OTc0E8Rl1'),
          ),
        ),
      ),
    );
  }
}

class BackGroundAssetImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        child: Text(
          "BomBooom",
          style: TextStyle(
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.redAccent,
                  blurRadius: 10,
                  offset: Offset(10, 20),
                )
              ],
              fontSize: 20,
              backgroundColor: Colors.teal),
        ),
        height: 200,
        width: 400,
        margin: EdgeInsets.all(40),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            fit: BoxFit
                .contain, // de bt5ly el sora tkhud el msa7a bta3t el sora kolaaha
            image: AssetImage('assets/Google.png'),
            repeat: ImageRepeat
                .repeat, // de 34an el sora lw mkfetsh 3la mostawa el size yefdl yekrrha 3la el Y axis
          ),
        ),
      ),
    );
  }
}



/*
  el container howa 3bara 3n 3elba bt7ot gowaha kol el data el enta 33auzha b7es t2sm el shasha bt3tk le kaza goz2
  momyztha tb3n enk te2dr tedy kol container el alwan bt3to w tedelo properties 5asa beh hwa bs
  ahm widget gowa el contianeer hwa  el child
 */

/*
  margin = (msafa mn bara el container -> ad eh el edge bta3 el container b3ed 3n el 3nasr el gmbo mn bara)
  
  margins: EdgeInsets <= this is how we start to apply the margins
  margin: EdgeInsets.fromLTRB(10, 20, 10, 5), // keda enta bt3ml  mn kol el nwa7y bs btedy kema lkol na7ya lw7da
  margin: EdgeInsets.all(10) // keda mn kol el nwa7y bnfs el kema,
  margin: EdgeInsets.all(10) // keda mn kol el nwa7y bnfs el kema,
  margin: EdgeInsets.only(left: 10, top: 5), // keda enta bt2olo e3mly margin mn fo2 w shmal bs, bt7dd el direction b3dha semi colon b3dha tktb el rkm
  margin: EdgeInsets.symmetric(vertical: 120, horizontal: 50), // keda enta bt2olo e3ml fo2 w t7t m3 b3d 3n tre2 el vertical w ymen w shmal m3 b3d 3n tre2 el horizontal
 */

/*
  Padding => El msafa mn gowa el contianer -> ad eh el klam b3ed 3n el edges bta3t el container mn gowa :) 
  
  nfs el functions bt3et el margin mwgoda fe el padding
     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
     padding: EdgeInsets.fromLTRB(0, 10, 20, 30),
     padding: EdgeInsets.all(5),
 */

/*
  decorations
  lw est5dmt el decoration gwa el container sa3tha hayb2a mamno3 enk test5dm el color widget
  34an lazm test5dmha gowa el decoration bs

  border: Border(
      left: BorderSide(color: Colors.red, width: 10, style: BorderStyle.solid) ,
      right: BorderSide(color: Colors.brown, width: 10),
      top: BorderSide(color: Colors.purple, width: 10),
      bottom: BorderSide(color: Colors.green, width: 10),
   ) de el tre2a el bn2dr enna n7dded beha kol boarder lw7do w ndey kol side lw7do el properties bt3to

  // de bn3ml boarder wa7ed w nedelo kol el properties
   // border: Border.all(width: 5, color: Colors.red, style: BorderStyle.solid)


  el boarder bytr7 mn 3rd el container
  bm3na en lw enta kont m7dd el width msln b 200 w 7tet boarder.all msln b 10 fanta keda kalt mn el width 10 * 2 = 20
  fa el fadelk fl width homa 180 bs
  nfs el klam fl padding brdu byakhud mn 7gm el container nfso

  // bs bshrt en el boarder ykon .all mynf34 ykon 3aml lkol 7arf lw7do
  borderRadius: BorderRadius.all(Radius.circular(40)), // de 3n tre2ha b2dr a5ly el container 3la shkl oven bdl el rectange

  // enta keda bt3ml boarder mn na7ya wahda bs aw enta el bt7dded y3ny :D
  borderRadius: BorderRadius.only(  bottomLeft: Radius.circular(40), topRight: Radius.circular(40)), // de 3n tre2ha b2dr a5ly el container 3la shkl oven bdl el rectange


  // images
  there are two types of images
  1- Network images -> de bygebha mn el internet btedelo el link w hwa bydwr 3leha w ygebha
  2- AssetImage de bygbha mn el local bta3k 3ady -> btb2a asr3 l2eno msh by7tag y7mlha mn el internet

  1- Network Images: -> btft7 el constructor w tb3tlo el URL bta3 el sora -> ( get image link from any photo on google )
  fit Types:
  1- cover -> da by7afez 3la kol el ab3ad bta3et el sora mn 8er ma y3ml ay stretching
  bs by2os el sora b7es enha t fit fl size el enta b3to

  2- contian -> de by7ot el sora kolaha zy ma hya bs bykbrha w ys8rha 3la 7sb el dimensions el enta 7atetha bs msh by3ml stretching

  3- fill -> by3ml stretching b7es en el sora tkfy kol el dimensions el enta 7atetha

  2- asset images
    1- lazm el awl tro7 el pubspec file
    2- tektb gowah el strent do
      * assets:
          -(folderName which contains the photos)/
      ie:
      assets:
        -assets/
    3- tft7 el cmd 3la el path el mwgod feh el project
    4- run this command "flutter pub get"
    5- eb3t el photo path fl constructor bta3 assetImage

    repeat: ImageRepeat.repeatY, // de 34an el sora lw mkfetsh 3la mostawa el size yefdl yekrrha 3la el Y axis
    repeat: ImageRepeat.repeatX, // de 34an el sora lw mkfetsh 3la mostawa el size yefdl yekrrha 3la el X axis
    repeat: ImageRepeat.repeat, // de 34an el sora lw mkfetsh 3la mostawa el size yefdl yekrrha 3la el Y axis w el X axis

 */


/*
  PubSpec.yaml ->
  da file wazefto eno y7ot el packages el ana bst5dmha gowa el project folders
 */



