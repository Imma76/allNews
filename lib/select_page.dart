import 'package:all_news/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'selection.dart';
import 'responsive.dart';
//
class SelectionPage extends StatelessWidget {
  static const id = 'Selection';
  final List<Selection> todos = [
    Selection(
      'Argentina',
      'ar',
    ),
    Selection(
      'Australia',
      'au',
    ),
    Selection(
      'Austria',
      'at',
    ),
    Selection(
      'Belgium',
      'be',
    ),
    Selection(
      'Brazil',
      'br',
    ),
    Selection(
      'Bulgaria',
      'bg',
    ),
    Selection(
      'Canada',
      'ca',
    ),
    Selection(
      'China',
      'cn',
    ),
    Selection('Colombia', 'co'),
    Selection(
      'Cuba',
      'cu',
    ),
    Selection(
      'Czech Republic',
      'cz',
    ),
    Selection(
      'Egypt',
      'eg',
    ),
    Selection(
      'France',
      'fr',
    ),
    Selection(
      'Germany',
      'de',
    ),
    Selection(
      'Greece',
      'gr',
    ),
    Selection(
      'Hong Kong',
      'hk',
    ),
    Selection(
      'Hungary',
      'hu',
    ),
    Selection(
      'India',
      'in',
    ),
    Selection('Indonesia', 'id'),
    Selection(
      'Ireland',
      'ie',
    ),
    Selection(
      'Israel',
      'il',
    ),
    Selection(
      'Italy',
      'it',
    ),
    Selection(
      'Japan',
      'jp',
    ),
    Selection(
      'Latvia',
      'lv',
    ),
    Selection(
      'Lithuania',
      'lt',
    ),
    Selection(
      'Malaysia',
      'my',
    ),
    Selection(
      'Mexico',
      'mx',
    ),
    Selection(
      'Morocco',
      'ma',
    ),
    Selection(
      'Netherlands',
      'nl',
    ),
    Selection(
      'New Zealand',
      'nz',
    ),
    Selection(
      'Nigeria',
      'ng',
    ),
    Selection(
      'Norway',
      'no',
    ),
    Selection(
      'Philippines',
      'ph',
    ),
    Selection(
      'Poland',
      'pl',
    ),
    Selection(
      'Portugal',
      'pt',
    ),
    Selection(
      'Romania',
      'ro',
    ),
    Selection(
      'Russia',
      'ru',
    ),
    Selection(
      'Saudi Arabia',
      'sa',
    ),
    Selection(
      'Serbia',
      'rs',
    ),
    Selection(
      'Singapore',
      'sg',
    ),
    Selection(
      'Slovakia',
      'sk',
    ),
    Selection(
      'Slovenia',
      'si',
    ),
    Selection(
      'South Africa',
      'za',
    ),
    Selection(
      'South Korea',
      'kr',
    ),
    Selection(
      'Sweden',
      'se',
    ),
    Selection(
      'Switzerland',
      'sw',
    ),
    Selection(
      'Taiwan',
      'tw',
    ),
    Selection(
      'Thailand',
      'th',
    ),
    Selection(
      'Turkey',
      'tr',
    ),
    Selection(
      'UAE',
      'ae',
    ),
    Selection(
      'Ukraine',
      'ua',
    ),
    Selection(
      'United Kingdom',
      'gb',
    ),
    Selection(
      'United States',
      'us',
    ),
    Selection(
      'Venuzuela',
      've',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon:Icon(Icons.arrow_back_ios_rounded),color: Colors.black,onPressed:(){Navigator.pop(context);} ),
        title: Text('Select country to read news',
            style: TextStyle(
                fontFamily: 'Lobster',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,color: Colors.black)),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(todos[index].country,style: TextStyle(fontFamily: 'Lobster',
                  fontSize:AdaptiveTextSize().getAdaptiveTextSize(context, 15),),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HeadlineNewsPageList(countryName: todos[index].code),
                    ),
                  );
                },
              ),
              Divider(height: 10,),
            ],
          );
        },
      ),
    );
  }
}
