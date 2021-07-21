import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; 

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 launchblog() async {
    final twitterUrl = "https://hashnode.com/@Jhaymes";
  if (await canLaunch(twitterUrl)) {
    await launch(twitterUrl,forceWebView:false,
    enableJavaScript:false);
  } else {
    throw 'Could not launch $twitterUrl';
  }
}
 launchGitHub() async {
    final githubUrl = "https://github.com/jhaymesdev";
  if (await canLaunch(githubUrl)) {
    await launch(githubUrl,forceWebView:false,enableJavaScript:false); 
  } else {
    throw 'Could not launch $githubUrl';
  }
}
launchLinkedIn() async {
    final linkedInUrl = "https://www.linkedin.com/in/jhaymes-129600193/";
  if (await canLaunch(linkedInUrl)) {
    await launch(linkedInUrl,forceWebView:false,enableJavaScript:false); 
  } else {
    throw 'Could not launch $linkedInUrl';
  }
}
   _sendMail() async {
  // Android and iOS
  const mailTo = "jhaymesifiok@gmail.com"; 
  const dummyMessage = "Hello World";
const subjectText ="Add subject";
  const uri = 'mailto:$mailTo?subject=$subjectText&body=$dummyMessage';
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    throw 'Could not launch $uri';
  }
}
   @override
  Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                //SizedBox(),
          AnimatedTextKit(animatedTexts: [
            TypewriterAnimatedText(
                "Hey! I am Jhaymes :)",
                textStyle: TextStyle(fontSize:50,
                color: Color(0xff918E85,),),
                speed: Duration(milliseconds:100),
                cursor: "...",
                curve: Curves.linear,
            ),
        ],
        isRepeatingAnimation: false,
        pause: Duration(milliseconds:500),
        displayFullTextOnTap: true,
        repeatForever: false,
        stopPauseOnTap: false,
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
                    TextAndFunc(
                      text: "articles",
                      function: launchblog, 
                    ),
                    TextAndFunc(
                      text: "code",
                      function: launchGitHub,
                    ),TextAndFunc(
                      text: "linkedIn",
                      function: launchLinkedIn,
                    ),TextAndFunc(
                      text: "contact",
                      function: _sendMail,
                    ),
                  ],
                ),
                ]),
            ),
            backgroundColor: Colors.black,
            );
     }
  }


// ignore: must_be_immutable
class TextAndFunc extends StatelessWidget {
   TextAndFunc({this.text,this.function}) ;
  String? text;
  Function? function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        hoverColor: Colors.blue[200],
        child: Text(text!,style:TextStyle(color: Colors.white)),
        onTap:  () => function!() ,
      ),
    );
  }
}