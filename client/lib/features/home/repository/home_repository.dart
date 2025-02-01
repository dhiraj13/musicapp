import 'dart:io';

import 'package:client/core/constants/server_constant.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<void> uploadSong(
    File selectedAudio,
    File selectedImage,
  ) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${ServerConstant.serverURL}/song/upload'),
    );

    request
      ..files.addAll(
        [
          await http.MultipartFile.fromPath('song', selectedAudio.path),
          await http.MultipartFile.fromPath('thumbnail', selectedImage.path),
        ],
      )
      ..fields.addAll(
        {
          'artist': 'Mohit',
          'song_name': 'Phir se ud chala',
          'hex_code': 'FFFFFF',
        },
      )
      ..headers.addAll(
        {
          'x-auth-token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEyNWRiMGUwLWZkOTUtNDI5Ni1hODBiLWQ2ZDE5NGM3ZWIxNSJ9.9RRwByI70YEanGfuwHr9xRZFccERCgTnQaGOLleTN-c',
        },
      );

    final res = await request.send();
    print(res);
  }
}
