import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter_app/api/models/UserAccount.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import './models/GalleryAlbum.dart';
import './models/GalleryTags.dart';

class ImgurAPi {
  Future<String> _loadAccountInfo(String username, String refreshToken) async {
    final response = await http.get(
      'https://api.imgur.com/3/account/' + username,
      headers: {HttpHeaders.authorizationHeader: "Bearer " + refreshToken,
        HttpHeaders.authorizationHeader: "Client-ID <your-client-id-here>"},
    );
    return response.body;
  }
  Future<String> _loadTags() async {
    final response = await http.get(
      'https://api.imgur.com/3/tags',
      headers: {HttpHeaders.authorizationHeader: "Client-ID <your-client-id-here>"},
    );
    return response.body;
  }
  Future<String> _loadSearch(int page, String tag) async {
    final response = await http.get(
      'https://api.imgur.com/3/tags',
      headers: {HttpHeaders.authorizationHeader: "Client-ID <your-client-id-here>"},
    );
    return response.body;
  }
  Future<String> _loadPhotoAsset(int page, String tag) async {
    final response = await http.get(
      'https://api.imgur.com/3/gallery/t/' + tag +'/' + page.toString(),
      headers: {HttpHeaders.authorizationHeader: "Client-ID <your-client-id-here>"},
    );
    return response.body;
  }

  Future<List<UserAccount>> loadUserAccountInfo(String username, String refreshToken) async {
    String jsonPhotos = await _loadAccountInfo(username, refreshToken);
    //print(jsonPhotos);
    print("LA");
    final jsonResponse =
    json.decode(jsonPhotos)['data'] as List<dynamic>;
    print("ICI");
    print(jsonResponse);
    Iterable<UserAccount> accountInfoList =
    jsonResponse.map((it) => UserAccount.fromJson(it));
    print(accountInfoList);
    return accountInfoList;
  }

  Future<List<GalleryAlbum>> loadPhotos(int page, String tag) async {
    String jsonPhotos = await _loadPhotoAsset(page, tag);
    final jsonResponse =
        json.decode(jsonPhotos)['data']['items'] as List<dynamic>;
    List<GalleryAlbum> photosList =
        jsonResponse.map((it) => GalleryAlbum.fromJson(it)).toList();
    return photosList;
  }

  Future<List<GalleryAlbum>> loadSearch(int page, String tag) async {
    String jsonPhotos = await _loadSearch(page, tag);
    final jsonResponse =
    json.decode(jsonPhotos)['data'] as List<dynamic>;
    List<GalleryAlbum> photosList =
    jsonResponse.map((it) => GalleryAlbum.fromJson(it)).toList();
    return photosList;
  }

  Future<List<GalleryTags>> loadTags() async {
    String jsonPhotos = await _loadTags();
    final jsonResponse =
    json.decode(jsonPhotos)['data']['tags'] as List<dynamic>;
    List<GalleryTags> photosList =
    jsonResponse.map((it) => GalleryTags.fromJson(it)).toList();
    return photosList;
  }
}
