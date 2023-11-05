import 'package:bitcoin_ticker/networking.dart';

import 'constants.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<String> getExchangeRateByCurrency(String currency) async {
    final sb = StringBuffer(baseCoinAPIUrl);
    sb..write('$currency?apiKey=$kApiKey');

    String urlToGetCurrentExchangeValue = sb.toString();
    NetworkHelper nh = NetworkHelper(url: urlToGetCurrentExchangeValue);
    dynamic coinData = await nh.getData();
    double exchangeRate = coinData['rate'];

    return exchangeRate.toStringAsFixed(0);
  }
}
