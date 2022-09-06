import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart'; 

class AllnotesController extends GetxController {
  //TODO: Implement AllnotesController
  var isListening = false.obs;
  var  awal = "Tekan untuk memulai".obs;
  SpeechToText? speechToText;
  @override
  void onInit() {
    super.onInit();
    speechToText = SpeechToText();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void listen() async{
    if(!isListening.value) {
      bool available =  await speechToText!.initialize( onStatus: (val){},onError: (val){});
      if(available){
        isListening.value= true;
        speechToText!.listen( onResult: (val){
          awal.value = val.recognizedWords;
        } );
      }
    }else{
      isListening.value = false;
      speechToText!.stop();
      awal.value = '';
    }
  }

}
