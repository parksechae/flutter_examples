import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_storage/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  String _imageUrl = '';

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
          _imageUrl = '';
        });
      } else {
        if (kDebugMode) {
          print('이미지 선택이 취소되었습니다.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('이미지를 선택하는 동안 오류가 발생했습니다: $e');
      }
    }
  }

  Future<void> _uploadImage() async {
    if (_image != null) {
      final fileName = _image!.path.split('/').last;
      final file = File(_image!.path);

      log('fileName: $fileName');

      try {
        await supabase.storage.from('images').upload(fileName, file);
        final imageUrl = await _getImageUrl(fileName);

        setState(() {
          _imageUrl = imageUrl;
        });

        if (kDebugMode) {
          print('이미지 업로드 성공');
        }
      } catch (e) {
        if (kDebugMode) {
          print('이미지 업로드 실패: $e');
        }
      }
    }
  }

  Future<String> _getImageUrl(String fileName) async {
    final response = supabase.storage.from('images').getPublicUrl(fileName);
    return response;
  }

  // 클립보드에 URL 복사
  Future<void> _copyToClipboard() async {
    if (_imageUrl != '') {
      await Clipboard.setData(ClipboardData(text: _imageUrl));
      if (kDebugMode) {
        print('클립보드에 URL 복사됨');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('클립보드에 URL이 복사되었습니다.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('이미지 업로드')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image != null ? Image.file(_image!) : const Text('이미지를 선택하세요'),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('이미지 선택'),
              ),
              ElevatedButton(
                onPressed: _uploadImage,
                child: const Text('이미지 업로드'),
              ),
              const SizedBox(height: 20),
              // _url != null
              //     ? SelectableText('업로드 이미지 URL: $_url') // SelectableText로 변경
              //     : const Text('이미지가 업로드되지 않았습니다.'),
              _imageUrl != ''
                  ? Column(
                      children: [
                        SingleChildScrollView(
                          child: SelectableText(
                            '업로드 이미지 URL: $_imageUrl',
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: _copyToClipboard,
                          child: const Text('URL 클립보드에 복사'),
                        ),
                      ],
                    )
                  : const Text('이미지가 업로드되지 않았습니다.'),
              // _imageUrl != ''
              //     ? SingleChildScrollView(child: Image.network(_imageUrl ?? ' '))
              //     : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
