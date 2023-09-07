import 'dart:io';
import 'dart:typed_data';

import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opencv_4/factory/pathfrom.dart';
import 'package:opencv_4/opencv_4.dart';
import 'package:path_provider/path_provider.dart';

class ScoreTextRecognition {
  final XFile _image;
  File? _tempImage;
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.korean);
  late Future _doneFuture;
  ScoreTextRecognition(this._image) {
    _doneFuture = _init();
  }

  Future<File> scoreProcessing() async
  {
    await _doneFuture;
    await _preprocessingByCV2();
    var inputImage = InputImage.fromFile(File(_tempImage!.path));
    _processImage(inputImage);
    return _tempImage!;
  }

  Future _init() async {
    var dir = await getTemporaryDirectory();
    var filename = '${dir.path}/temp.png';
    _tempImage = File(filename);
  }
  Future get initializationDone => _doneFuture;

  Future<void> _preprocessingByCV2() async {
    /*Important Part*/
    Uint8List byte = await Cv2.adaptiveThreshold(
      pathFrom: CVPathFrom.GALLERY_CAMERA,
      pathString: _image.path,
      maxValue: 125,
      adaptiveMethod: Cv2.ADAPTIVE_THRESH_MEAN_C,
      thresholdType: Cv2.THRESH_BINARY,
      blockSize: 11,
      constantValue: 30,
    );
    await _tempImage!.writeAsBytes(byte);
    /*Fine.*/
  }
  void _processImage(InputImage inputImage) async {
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
    List<TextElement> textSet = [];
    List<TextElement> subjects = [];
    List<TextElement> scores = [];
    List<TextElement> times = [];
    Map<String, List<Pair<int, int>>> usrMapData = {"국어" : [] , "수학" : [], "영어" : [], "과학" : []};
    int i,j;
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          textSet.add(element);
        }
      }
    }

    Pair<int, int> subjectLoc = _calcPos("학기", "교과", textSet);
    Pair<int, int> scoreLoc = _calcPos("성취도", "석차등급", textSet);
    Pair<int, int> timeLoc = _calcPos("과목", "단위수", textSet);
    for (var texts in textSet) {
      if (texts.boundingBox.left > subjectLoc.first && texts.boundingBox.left < subjectLoc.last && texts.text != "과목") {
        if (texts.text.contains("국어") || texts.text.contains("수학") || texts.text.contains("영어") || texts.text.contains("과학")) {
          subjects.add(texts);
        }
      }
      if (texts.boundingBox.left > scoreLoc.first && texts.boundingBox.left < scoreLoc.last && texts.text != "석차등급") {
        scores.add(texts);
      }
      if (texts.boundingBox.left > timeLoc.first && texts.boundingBox.left < timeLoc.last && texts.text != "단위수") {
        times.add(texts);
      }
    }
    //Sort Data by y axis
    subjects.sort((a, b) => a.boundingBox.top.compareTo(b.boundingBox.top));

    //Arrange Data by row
    for (var element in subjects) {
      for (i = 0; i < scores.length; i++) {
        if (element.boundingBox.top <= (scores[i].boundingBox.top + scores[i].boundingBox.bottom) / 2 &&
            element.boundingBox.bottom >= (scores[i].boundingBox.top + scores[i].boundingBox.bottom) / 2) {
          for(j = 0; j < times.length; j++)
          {
            if(element.boundingBox.top <= (times[j].boundingBox.top + times[j].boundingBox.bottom) / 2 &&
                element.boundingBox.bottom >= (times[j].boundingBox.top + times[j].boundingBox.bottom) / 2)
            {
              // usrData.add(Pair(element.text, int.parse(scores[i].text)));
              usrMapData[element.text]!.add(Pair(int.parse(scores[i].text),int.parse(times[j].text)));
              break;
            }
          }
          if (j == times.length) {
            // usrData.add(Pair(element.text, -1));
            usrMapData[element.text]!.add(Pair(int.parse(scores[i].text),-1));
          }
          break;
        }
      }
      if (i == scores.length) {
        // usrData.add(Pair(element.text, -1));
        usrMapData[element.text]!.add(Pair(-1,-1));
      }
    }
    for(var sub in usrMapData.keys)
    {
      for(int l = 0; l < usrMapData[sub]!.length; l++)
      {
        print("$sub${l + 1} : ${usrMapData[sub]![l].first}등급, ${usrMapData[sub]![l].last}단위");
      }
    }
  }
  String _parseSubject(String str)
  {
    String rst = "";
    if(str.contains("국어")) {
      rst = "국어";
    } else if(str.contains("수학")) {
      rst = "수학";
    } else if(str.contains("영어")) {
      rst = "영어";
    } else if(str.contains("과학")) {
      rst = "과학";
    } else if(str.contains("사회")) {
      rst = "사회";
    }
    return rst;
  }
  Pair<int, int> _calcPos(String from, String to, List<TextElement> textSet) {
    int fst = -1, lst = -1;
    for (var texts in textSet) {
      if (texts.text == from) {
        fst = texts.boundingBox.right.toInt();
      } else if (texts.text == to) {
        lst = texts.boundingBox.right.toInt();
      }
    }
    return Pair(fst, lst);
  }
}
