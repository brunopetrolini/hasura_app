import 'package:flutter/material.dart';

class CardProductWidget extends StatelessWidget {
  final String title;
  final String category;
  final String prodType;
  final String price;
  final String idProduct;

  const CardProductWidget(
      {Key key,
      @required this.title,
      @required this.category,
      @required this.prodType,
      @required this.price,
      @required this.idProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/update/$idProduct");
      },
      child: Card(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 50,
              right: -50,
              child: CircleAvatar(
                radius: 130,
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.4),
              ),
            ),
            Positioned(
              top: 100,
              right: 50,
              child: CircleAvatar(
                radius: 130,
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.3),
              ),
            ),
            Positioned(
              top: 120,
              right: 150,
              child: CircleAvatar(
                radius: 130,
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.1),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "$title",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "$category",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "$prodType",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        "$price",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
