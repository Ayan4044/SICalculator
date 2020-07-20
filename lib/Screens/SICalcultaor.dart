import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class SICalcuator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SICalculator();
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _SICalculator extends State<SICalcuator> {
  String dropdownValue;
  String _value;
  var _currencies = ['Dollar', 'Pound', 'Rupees'];
  var _hint = ['Select'];
  var _selectedColor = Color(0xFFEEEEEE);
  bool isSelected = false;
  bool itemadded = false;
  TextEditingController PrincipalAmount = TextEditingController();
  TextEditingController RatePercent = TextEditingController();
  TextEditingController Term = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      /*appBar: AppBar(
        title: Text(
          "SI Calculator",
          style: TextStyle(color: Color(0xFFF5f5f5)),
        ),
      ),*/
      body: Container(
        margin: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: LoadImageAsset(),
            ),
            PrinciapTextField(),
            RateofInterestTextField(),
            Row(
              children: <Widget>[
                Expanded(
                  child: TermTextField(),
                ),
                Expanded(
                  child: DropDownMoney(),
                ),
              ],
            ),
            Row(children: <Widget>[
              CalculateButton(),
              ResetButton(),
            ]),
           /* Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                result,
                style: TextStyle(color: Color(0xFFE0415E), fontSize: 15.0),
              ),
            ),*/
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }

  Widget LoadImageAsset() {
    AssetImage assetImage = AssetImage('images/money.png');
    Image image = Image(image: assetImage, width: 200.0, height: 150.0);
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      child: image,
    );
  }

  //principal textfield
  Widget PrinciapTextField() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
        //Wrap with Material
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
        elevation: 18.0,

        child: TextField(
          controller: PrincipalAmount,
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.attach_money),
            filled: true,
            fillColor: Color(0xFF292847),
            labelText: "Principal Amount",
            labelStyle: TextStyle(color: Color(0xFFFAFAFA)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }

  //Rate interest textfield
  Widget RateofInterestTextField() {
    var padding = Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
        //Wrap with Material
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
        elevation: 18.0,

        child: TextField(
          controller: RatePercent,
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.attach_money),
            filled: true,
            fillColor: Color(0xFF292847),
            labelText: "Rate of Interest for Principal",
            labelStyle: TextStyle(color: Color(0xFFFF5F5F5)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
            ),
          ),
        ),
      ),
    );
    return padding;
  }

  Widget TermTextField() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
        //Wrap with Material
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
        elevation: 18.0,
        child: TextField(
          controller: Term,
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.attach_money),
            filled: true,
            fillColor: Color(0xFF292847),
            labelText: "Term",
            labelStyle: TextStyle(color: Color(0xFFFF5F5F5)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget DropDownMoney() {
    // _currencies.removeAt(3);
    //_currencies.removeAt(0);
    /*  if(itemadded)
      {
        _currencies.removeAt(3);
      }*/
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
            color: Colors.blueGrey, style: BorderStyle.solid, width: 0.80),
      ),
      child: Padding(
        padding: EdgeInsets.all(1.0),
        child: Material(
          //shape:
          //RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
          elevation: 18.0,
          color: Color(0xFF292847),
          child: DropdownButton<String>(
            isExpanded: true,
            hint: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Select Currency',
                style: TextStyle(color: Color(0xFFF5F5F5)),
              ),
            ),

            icon: Icon(
              Icons.arrow_downward,
              textDirection: TextDirection.ltr,
            ),
            iconSize: 20,
            elevation: 40,
            //style: TextStyle(color: Color(0xFFFAFAFA)),
            underline: Container(
              height: 0,
            ),
            onTap: () {
              // isSelected = false;
              dropdownValue = "";

              //_selectedColor = Color(0xff4B4E56);
              debugPrint("on tapped");
              if (itemadded) {
                _currencies.removeAt(3);
              }
            },

            items: _currencies.map<DropdownMenuItem<String>>((String value) {
              debugPrint(value);
              //CheckConditions();
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 14.0, color: _selectedColor),
                  ),
                ),
              );
            }).toList(),
            onChanged: (String valueSelected) {
              onDropDownItemChanged(valueSelected);

              /* isSelected
                  ? _selectedColor = Colors.white70
                  : _selectedColor = Colors.black;*/

              // _selectedColor=Color(0xfffafafa);
            },

            value: dropdownValue,

            //00000value: dropdownValue,
          ),
        ),
      ),
    );
  }

  void onDropDownItemChanged(String itemSelected) {
    setState(() {
      dropdownValue = itemSelected;
      isSelected = true;
    });
  }

  //Reset Button
  Widget ResetButton() {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.all(5.0),
      child: RaisedButton(
        elevation: 8.0,
        padding: EdgeInsets.all(10.0),
        color: Color(0xFFF96838),
        onPressed: () {
          setState(() {
            clearFields();
          });
        },
        child: Text('Reset',
            style: TextStyle(fontSize: 15, color: Color(0xFFf5f5f5))),
      ),
    ));
  }

  //Calculate Button
  Widget CalculateButton() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: RaisedButton(
          elevation: 8.0,
          padding: EdgeInsets.all(10.0),
          color: Color(0xFF52DE97),
          onPressed: () {
            setState(() {
              result = Result();
              Toast.show(result, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
            });
          },
          child: Text('Calculate',
              style: TextStyle(fontSize: 15, color: Color(0xFFf5f5f5))),
        ),
      ),
    );
  }

  void clearFields() {
    //   _currencies.add("Select Currency");
    // itemadded=true;
    //debugPrint(itemadded);
    //dropdownValue=_currencies[0];
    dropdownValue = null;
    PrincipalAmount.text = '';
    Term.text = '';
    RatePercent.text = '';
  }

  String Result() {
    double si = double.parse(PrincipalAmount.text) +
        (double.parse(PrincipalAmount.text) *
                double.parse(RatePercent.text) *
                double.parse(Term.text)) /
            100;

    return "After ${Term.text} years, amoount will be $si in $dropdownValue";
  }

  void CheckConditions() {
    if (itemadded) {
      _currencies.removeAt(3);
    }
  }
}
