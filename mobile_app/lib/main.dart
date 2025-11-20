import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() 
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      home: MusicScreen(),
    );
  }
}

class MusicScreen extends StatefulWidget 
{
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> 
{
  List<dynamic> lines = [];
  bool isLoading = true;

  @override
  void initState() 
  {
    super.initState();
    fetchLyrics();
  }

  fetchLyrics() async 
  {
    var url = Uri.parse('http://10.0.2.2:5222/Music/lyrics'); 
    
    try 
    {
      var response = await http.get(url);
      if (response.statusCode == 200) 
      {
        setState(() 
        {
          lines = json.decode(response.body);
          isLoading = false;
        });
      } 
      else 
      {
        print("Erro no servidor: ${response.statusCode}");
      }
    } 
    catch (e) 
    {
      print("Erro de conexão: $e");
    }
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: Text("DropLyric MVP")),
      body: isLoading 
          ? Center(child: CircularProgressIndicator()) 
          : Padding
          (
              padding: EdgeInsets.all(20),
              child: Column
              (
                children: lines.map((line) 
                {
                  List<dynamic> words = line['words'];
                  
                  return Wrap
                  (
                    spacing: 8.0,
                    children: words.map((word) 
                    {
                      bool isHidden = word['isHidden'];
                      String originalText = word['text'];
                      
                      String displayText = isHidden 
                          ? originalText.replaceAll(RegExp(r'.'), '●') 
                          : originalText;

                      return Text
                      (
                        displayText, 
                        style: TextStyle
                        (
                          fontSize: 24,
                          color: isHidden ? Colors.grey : Colors.black,
                          letterSpacing: 2.0
                        )
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
    );
  }
}