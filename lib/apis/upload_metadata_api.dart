import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> uploadMetadataToNFTStorage(String jsonContent) async {
  final url = Uri.parse('https://api.nft.storage/upload');
  final headers = {'Authorization': 'Bearer YOUR_API_KEY'};
  final request = http.MultipartRequest('POST', url);

  request.fields['Content-Type'] = 'application/json';
  request.headers.addAll(headers);
  request.files.add(http.MultipartFile.fromString('metadata.json', jsonContent));

  final response = await request.send();
  final respStr = await response.stream.bytesToString();

  if (response.statusCode == 200) {
    final respData = jsonDecode(respStr);
    final ipfsHash = respData['value']['cid'];
    final metadataUri = 'ipfs://$ipfsHash';
    return metadataUri;
  } else {
    throw Exception('Failed to upload metadata: $respStr');
  }
}