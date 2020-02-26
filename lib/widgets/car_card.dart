import 'package:flutter/material.dart';

import '../models/carmodel.dart';

class CarCard extends StatelessWidget {
  final CarModel car;

  CarCard(this.car);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(car.image),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildCarTitle(car.title),
              SizedBox(width: 10.0),
              Text(
                '\$$car.price.toString()',
                style: TextStyle(color: Colors.purple),
              ),
            ],
          ),
          Text(car.userEmail),
          SizedBox(height: 10.0),
          _buildCarLocation('United Kingdom'),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Colors.blue,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                color: Colors.red,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCarTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildCarLocation(String location) {
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(location),
    );
  }
}
