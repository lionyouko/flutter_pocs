

// async away and future

// assynchronous programming: tasks can be solved in parallel, not one after another

// we can wait for them to finish (like witing children in C)

  // keywords async / await
  // async enables assynchronous and enable use of await
  // but the only type that can be await(ed) is Future (method) datatype 
void main() async {
  // if async, it goes way up to the end
  DataService dataService = DataService();
  String data = await dataService.getData();
  print(data);

}

class DataService {

  Future<String> _getDateFromCloud () async {
    // faking it (dart has sleep function)
    // but we can do something else:
    // we can use await because the type is Future
    await Future.delayed(Duration(seconds: 2));
    return "fake data";

  }

  Future<String> _parseDateFromCloud ({required String dataFromCloud}) async {
    // faking it (dart has sleep function)
    // but we can do something else:
    // we can use await because the type is Future
    await Future.delayed(Duration(seconds: 1));
    return "parsed fake data";

  }

  // if Future, must have async keyword
  Future<String> getData() async {
    // get data - it waits the function then keep going
    // if I get the await and just make _getDateFromCloud(), it will run in "parallel" to _parseDateFromCloud
    final String dataFromcloud = await _getDateFromCloud();
    
    // parse data - it waits the funciton then keep going (the normal is to go without wait or block waiting if it was in main thread)
    final String parsedDataFromCloud = await _parseDateFromCloud(dataFromCloud: dataFromcloud);

    // return data
    return parsedDataFromCloud;
  }


}