import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:kode_pos_nusantara/json.dart';

class HttpHelper {

	final String urlSearchBase =
      'https://kodepos.vercel.app/search/?q=';

	Future<List> findPostal(String title) async {
    final String query = urlSearchBase + title;
    Response result = await get(Uri.parse(query));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final dataMap = jsonResponse['data'];
      List data = dataMap.map((i) => Data.fromJson(i)).toList();
      return data;
    } else {
      return [];
    }
    print('STAUS CODE${result.statusCode}');
	}

}