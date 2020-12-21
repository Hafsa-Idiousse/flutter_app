import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomDealCard extends StatefulWidget {
  final Map<String,dynamic> deal ;
  CustomDealCard(this.deal);
  @override
  _CustomDealCardState createState() => _CustomDealCardState();
}
class _CustomDealCardState extends State<CustomDealCard> {
  NetworkImage dealImage;
  String heat ;
  String dealDescription ;
  String expiryDate ;
  String since ;
  String store;
  String dealPrice ;
  String oldPrice ;
  String discount ;
  String deliveryPrice ;
  int commentsNumber ;
  String userName ;
  NetworkImage userImage ;
  @override
  void initState (){
    super.initState();
    dealImage = NetworkImage('https://dealexceptionnel.com/wp-content/uploads/2018/11/cropped-deal-e1460770502655.jpg');
    dealDescription ="Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.";
    expiryDate = 'Auj';
    since = '18h';
    store = 'Carrefour';
    dealPrice = '92.39' ;
    oldPrice = '80 £';
    discount = '10 £' ;
    deliveryPrice = 'Gratuit';
    commentsNumber = 165;
    userName = 'User';
    userImage = NetworkImage('https://dealexceptionnel.com/wp-content/uploads/2018/11/cropped-deal-e1460770502655.jpg');
  }
  @override
  Widget build(BuildContext context) {
    heat = '${widget.deal['heat']}°';
    return Card(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      elevation: 2,
      child: InkWell(
        onTap: () async {
          String result = await Navigator.push(context, MaterialPageRoute(builder: (context) => Try()));
          print(result);
        },
        child: Column(
          children: [
            Container( //Upper_block
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 80,
                    width: 80,
                    color: Colors.black,
                    child: Image(
                      image: dealImage,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row( //Heat & Expiry_date & Since
                          children: [
                            Card(//Heat
                              child: Row(
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.remove_outlined), onPressed: (){},
                                      color: Colors.blue[600],
                                      ),
                                  Text(
                                  heat,
                                    style: TextStyle(
                                      color: widget.deal['heat']> 0? widget.deal['heat']>99? Colors.red:Colors.orange :Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                      color: Colors.red,
                                      icon: Icon(Icons.add),onPressed: (){},
                                      ),
                                ],
                              ),
                            margin: EdgeInsets.all(10),
                            ),
                            Spacer(),
                            Container(//Expiry_date
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(
                                      Icons.hourglass_bottom,
                                    color: Colors.grey[700],
                                  ),
                                  Text(
                                      expiryDate,
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ),
                            Container(//Since
                              margin: EdgeInsets.all(10),
                                child: Text(
                                    since,
                                  style: TextStyle(color: Colors.grey[700]),
                                )),
                          ],
                        ),
                        Container(//Deal_description
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                          child: Text(
                          dealDescription,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16),
                          softWrap: true,
                            ),
                        ),
                        Container(//Store
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                                store,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 18,
                              ),
                            )
                        ),
                        Container(//deal_price & old_price & discount & delivery icon & delivery_price
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
                          child: Row(
                            children: [
                              Text(//deal_price
                                  dealPrice,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Container(//old_price
                                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Text(
                                      oldPrice,
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  )),
                              Text(//discount
                                discount,
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                                ),
                              Container(//delivery_icon & delivery_price
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Row(
                                  children: [
                                    Icon(//delivery icon
                                        Icons.delivery_dining,
                                      color: Colors.grey[700],
                                    ),
                                    Text(//delivery_price
                                        deliveryPrice,
                                      style: TextStyle(
                                        color: Colors.grey[700]
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Container( //Footer
              height: 40,
              color: Colors.transparent,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                        child: Image( image: userImage)),
                  ),
                  Text(
                      userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    color: Colors.grey[700],
                      icon: Icon(Icons.bookmark), onPressed: (){}
                      ),
                  FlatButton.icon(
                    textColor: Colors.grey[700],
                      onPressed: (){},
                      icon: Icon(
                          Icons.question_answer,
                        color: Colors.grey[700],
                      ),
                      label: Text('$commentsNumber')),
                  FlatButton.icon(
                      onPressed: (){},
                    textColor: Colors.blue,
                      label: Text('VOIR DEAL'),
                  icon: Icon(Icons.zoom_in),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class Try extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context,'text');
        },
      ),
    );
  }
}

