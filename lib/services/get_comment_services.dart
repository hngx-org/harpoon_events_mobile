import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:mobile_events_app/controller/services/event_services.dart';

import '../../model/event_model.dart';

class GetCommentServices {
  final ProviderRef ref;

  GetCommentServices(this.ref);
  String eventEndpoint = 'http://web-01.okoth.tech/api/v1/events/';
  Future<List<Comment>> getComments({String? eventId}) async {
    try {
      final token = await getToken(ref);

      Response response = await get(
        Uri.parse("$eventEndpoint$eventId/comments"),
        headers: <String, String>{
          "accept": "application/json",
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer ${token.token}",
        },
      );
      debugPrint(eventId);
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['comments'];

        return result.map((data) => Comment.fromJson(data)).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }
}

final getCommentProvider =
    Provider<GetCommentServices>((ref) => GetCommentServices(ref));
final getComments = FutureProvider.family<List<Comment>, String>((ref, arg) {
  final fetchData = ref.watch(getCommentProvider).getComments(eventId: arg);
  return fetchData;
});
