import 'package:http/http.dart' as http;
//...
//Here comes code of Flutter
//...
//Now I define the async function to make the request
void makeRequest() async{
  var response = await http.get('https://speiseplan.app.itelligence.org/');
  //If the http request is successful the statusCode will be 200
  if(response.statusCode == 200){
    String htmlToParse = response.body;
    print(htmlToParse);
  }
}
//...
//Here comes more Flutter code
//...
main(){
  makeRequest();
}