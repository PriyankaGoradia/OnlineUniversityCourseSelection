import 'package:flutter/material.dart';

String pwd = "";
String userrEmail = "";
bool Cauth = false;

var leftbar = Color(0xff040404);
var topbar = Color(0xff090909);
var bgcolor = Colors.black87;
var sign = TextStyle(
  color: Colors.white,
  fontSize: 13,
  fontWeight: FontWeight.w500,
);

var tableTitle = TextStyle(
  color: Colors.white,
  fontSize: 18,
);

var log = TextStyle(
  color: Colors.white,
  fontSize: 13,
  fontWeight: FontWeight.w500,
);

var sidebar = TextStyle(
  color: Colors.black,
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

var selectedSidebar = TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

var cardtitle = TextStyle(
  color: Colors.white,
  fontSize: 22,
  letterSpacing: 1.2,
  fontWeight: FontWeight.w700,
);

var cardsubtitle = TextStyle(
  color: Colors.white60,
  letterSpacing: 1,
  fontSize: 19,
  fontWeight: FontWeight.w400,
);

var carddesc = TextStyle(
  color: Colors.white70,
  letterSpacing: 0.1,
  fontSize: 15,
  fontWeight: FontWeight.w400,
);

class bull{
  String info,des,link;
  bull(this.info,this.des,this.link);

}

List<bull> artc = [
   bull("IIT Kharagpur launches free online course on IoT","The course is designed for undergraduate and postgraduate students.The course aims at helping learners introduce the fundamentals of IoT. The course spans over 12 weeks of time.","https://content.techgig.com/IIT-Kharagpur-launches-free-online-course-on-IoT/articleshow/79793965.cms?utm_source=TG_batch&utm_medium=email&utm_campaign=tg_prime_news_2020-12-19&date=2020-12-19&auth_login=NGhKUEpQNk1HcXl0elRaRFJDcFVobUlDd3VONjRWdU1YWG1JdkExdWRBNGhRd2pPdWY4d0lVMm95TkpJTStlaHVIU0Z1UlJTWEVjM1U3dUFveFYvS1E9PQ==&&etoken=NGhKUEpQNk1HcXl0elRaRFJDcFVodTlDNnpMWkp2K0xwZXlqV3FuTFhjbz0=&link_src=VWZEQ0NwOTYrOGc2NHQvcHFaK3Qzdz09&activity_name=NzI1MzQ3&template_type=0"),

bull("Best Python frameworks for 2021 to enhance coding experience","Python has come up as a great platform for web applications in the past few years.But we all know that frameworks can help in the development cycle making developers work easily on the app.","https://content.techgig.com/5-best-python-frameworks-for-2021-to-enhance-coding-experience/articleshow/79801608.cms"),

bull("AICTE offers free online course on full-stack development with 6-month internship","AICTE and Pupilfirst have signed a Memorandum of Understanding (MoU) to offer a free online internship to engineering students. The organisations have started an internship program called 'CoronaSafe Engineering Fellowship'.","https://content.techgig.com/aicte-offers-free-online-course-on-full-stack-development-with-6-month-internship/articleshow/79784262.cms"),

bull("4 #MostTrending tech job roles for 2021","Technology is the fastest evolving career sector among all. The field has immensely changed over the last few decades. Covid-19 pandemic has further changed the trends in the tech industry across the world.","https://content.techgig.com/4-hottest-tech-job-roles-for-2021/articleshow/79801234.cms"),
];

class courseOuter {
  String path;
  String title;
  String subtitle;
  String desc;
  
  courseOuter(this.path, this.title, this.subtitle,this.desc);
}

List<courseOuter> courses = [
  courseOuter("images/ai.jpg", "Introduction to AI", "IBM",
"AI is not only for engineers. If you want your organization to become better at using AI, this is the course to tell everyone--especially your non-technical colleagues--to take. "),

courseOuter("images/biology.jpg", "Introduction to BioTechnology", "IBM",
"Innovate with the Next Frontier in Technology. Learn how the biotechnology is leading to a paradigm shift in decentralized application programming."),

courseOuter("images/iot.jpg", "Introduction to Cyber Security", "IBM",
"An introduction to modern information and system protection technology and methods."),

courseOuter("images/finance.jpg", "Introduction to Finance", "IBM",
"Learn the basics of finance and accounting. Build a foundation of core business skills in finance and accounting"),

  courseOuter("images/History.jpg", "Introduction to History", "IBM",
"You will also have gained an understanding of the underlying mechanisms that have helped shape the history of everything and how they wil help  shape the future. "),

  courseOuter("images/psychology.jpg", "Introduction to Psychology", "IBM",
"This course will highlight the most interesting experiments within the field of psychology, discussing the implications of those studies for our understanding of the human mind and human behavior.  "),

  courseOuter("images/ethical-hack.jpg", "Introduction to Data Science", "IBM",
"Kickstart your career in data science & ML. Master data science, learn Python & SQL, analyze & visualize data, build machine learning models"),

  courseOuter("images/webdev.jpg", "Introduction to Web Development", "IBM",
"Learn to Design and Create Websites. Build a responsive and accessible web portfolio using HTML5, CSS3, and JavaScript"),

  courseOuter("images/social-marketing.jpg", "Introduction to Digital Marketing", "IBM",
"Drive Customer Behavior Online. A six-course overview of the latest digital marketing skills, taught by industry experts."),

  courseOuter("images/robotics.jpg", "Introduction to Robotics", "IBM",
"Learn the Building Blocks for a Career in Robotics. Gain experience programming robots to perform in situations and for use in crisis management"),
  
];
