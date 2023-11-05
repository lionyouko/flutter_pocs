import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

//C162: Here we see an import keyword of flutter: the show keyword.
// It means to make only the show Item available to code, instead the entire package.
// Similarly, there is a hide keyword that means everything aside the Items after the hide keyword.
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String baseCurrency = 'USD';
  String baseExchangeRate = '? USD';
  String exchangeRate = '0';

  @override
  void initState() {
    super.initState();
    getCurrentExchange(baseCurrency);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $baseExchangeRate',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            // C161: This is an example of platform specific widget that is however not being used platform specifically.
            // CupertinoPicker needs the height of each item, callback triggered always when an item is closest to the center of the picker, and the children, that can be any widget in this case
            child: getCurrencyPicker(),
          ),
        ],
      ),
    );
  }

  //C162: We put CupertinoPicker in a function in order to call this Widget for platformspecific needs, as being Android isntead of iOS
  CupertinoPicker getCupertinoPicker() {
    List<Text> pickerItems = [];

    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        baseCurrency = currenciesList[selectedIndex];
        getCurrentExchange(baseCurrency);
      },
      children: pickerItems,
    );
  }

  //C162: We put DropDownButton in a function in order to call this Widget for platformspecific needs, as being Android isntead of iOS
  DropdownButton<String> getDropDownButtom() {
    List<DropdownMenuItem<String>> dropdownMenuItems = [];

    for (String currency in currenciesList) {
      dropdownMenuItems.add(DropdownMenuItem(
        child: Text('$currency'),
        value: currency,
      ));
    }

    return DropdownButton<String>(
      //To faciliate to understand what the dropdown is about, we use the value att to define a default value showing

      // of course, as it links to a state of the app, we need to update the state, hence to have the current option variable and set state
      value: baseCurrency,
      //it waits a list of dropdown menu items, that will be DropDownMenuItem with child as whatever widget we want.
      items: dropdownMenuItems,
      //When somebody clicks the buttom, it will trigger on change, and the value will be the value in the item chosen.
      //If nothing is done for onChange, buttom may be disabled
      onChanged: (value) async {
        getCurrentExchange(baseCurrency);
      },
    );
  }

  //C162: simplest form to choose platform specific
  Widget getCurrencyPicker() {
    return Platform.isIOS
        ? getCupertinoPicker()
        : (Platform.isAndroid ? getDropDownButtom() : Placeholder());
  }

  void getCurrentExchange(String currency) async {
    try {
      exchangeRate = await CoinData().getExchangeRateByCurrency(currency);
      print(exchangeRate);
      updateUI(exchangeRate);
    } catch (e) {
      print(e);
    }
  }

  void updateUI(String rate) {
    setState(() {
      baseExchangeRate = '${exchangeRate} ${baseCurrency}';
    });
  }
}
