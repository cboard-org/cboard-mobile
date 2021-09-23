import 'dart:convert';
import 'package:http/http.dart';

class HttpService {
  final String boardsURL = "http://206.87.11.63:10010";

  Future<String> getPosts() async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im5nYW4wMTAwOUBnbWFpbC5jb20iLCJpZCI6IjYxMzM5ZTNiZWVlNWRiNzBkYzgxZDI3MiIsImlzc3VlciI6ImNib2FyZC5pbyIsImlhdCI6MTYzMjI2OTM1MH0.Mps-cfvM6734JlFwnezyKmqZPBnIRkEcxQbWYRjRxC4";
    Response res = await get(boardsURL + "/board/", headers: {
      "Authorization": "Bearer$token",
      "Content-Type": "application/json"
    });

    if (res.statusCode == 200) {
      String body = jsonDecode(res.body).toString();

      return body;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
