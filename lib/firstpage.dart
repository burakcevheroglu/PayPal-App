import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:paymentapp/purchaseinfo.dart';
import 'package:paymentapp/settings.dart';

int _selectedIndex = 0;
int _selectedButton = 0;
List<Widget> _currentPeriod = Periods().weekly;

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  static const List<Widget> _pages = [PageOne(), PageTwo()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.brightness_1_outlined),
        title: const Text('Paypal Wallet'),
        actions: const [
          ProfilePicture(),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: _pages.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(
          Icons.home_filled,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            _selectedIndex = 0;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          Icons.attach_money_sharp,
          Icons.query_stats_sharp,
        ],
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        activeColor: Colors.orange,
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        onTap: (index) => setState(() => _selectedIndex = index),
        //other params
      ),
    );
  }
}

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            periodWidget(0, "Week"),
            periodWidget(1, "Month"),
            periodWidget(2, "Year"),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _currentPeriod,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'SUBSCRIPTIONS',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              children: const [
                SubCard(image: "Discord_filled", name: "Discord", details: "Premium Account"),
                SubCard(image: "Spotify_filled", name: "Spotify", details: "Subscription"),
                SubCard(image: "Dropbox_filled", name: "Dropbox", details: "Premium Storage"),
                SubCard(image: "Twitter_filled", name: "Twitter", details: "Blue Tick"),
                SubCard(image: "eloboost_filled", name: "the1v9eloboost", details: "Account Eloboost"),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }

  InkWell periodWidget(int index, String text) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedButton = index;
          switch (index) {
            case 0:
              _currentPeriod = Periods().weekly;
              break;
            case 1:
              _currentPeriod = Periods().monthly;
              break;
            case 2:
              _currentPeriod = Periods().yearly;
              break;
          }
        });
      },
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: (_selectedButton == index)
                  ? MyColors().yellow
                  : [Colors.transparent, Colors.transparent],
            )),
        child: Align(
          child: Text(
            text,
            style: TextStyle(
                color: (_selectedButton == index) ? Colors.black : Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class SubCard extends StatelessWidget {
  const SubCard({
    super.key, required this.image, required this.name, required this.details,
  });

  final String image;
  final String name;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: MyColors().red,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 200, 180, 206),
            ),
            child: Center(child: Image.asset('images/$image.png',width: 40,)),
          ),
          const SizedBox(height: 10,),
          Text(name,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
          Text(details,style: TextStyle(fontSize: 14,color: Colors.grey.shade600),),
          TextButton(onPressed: (){}, child: const Text('Subscription Page',style: TextStyle(color: Color.fromARGB(255, 110, 90, 116),),))
        ],
      ),
    );
  }
}

class ChartColumn extends StatelessWidget {
  const ChartColumn({
    super.key,
    required this.time,
    required this.size,
  });

  final String time;
  final int size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          Expanded(
            flex: (8 - size),
            child: const SizedBox(),
          ),
          Expanded(
              flex: size,
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: MyColors().blue)),
              )),
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 1,
              child: Text(
                time,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ))
        ],
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          height: 270,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              PaypalCard(
                  color: MyColors().blue,
                  cardNumber: "1835 4508",
                  cardName: "Visual Card"),
              PaypalCard(
                  color: MyColors().yellow,
                  cardNumber: "2356 1902",
                  cardName: "Bank Card"),
              PaypalCard(
                  color: MyColors().red,
                  cardNumber: "5606 4574",
                  cardName: "Visual Card 2"),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Purchases',
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              letterSpacing: 3),
        ),
        Expanded(
          child: ClipRRect(
            child: ListView(
              children: const [
                PurchaseTile(
                  index: 0,
                  name: "Spotify",
                  date: "28 Jan 2023 - 13.56",
                  price: "-\$ 15.00",
                  image: "Spotify",
                  details: 'Spotify Premium Purchase',
                ),
                PurchaseTile(
                  index: 0,
                  name: "Food",
                  date: "28 Jan 2023 - 10.43",
                  price: "-\$ 3.75",
                  image: "Hamburger",
                  details: 'Dominos Purchase',
                ),
                PurchaseTile(
                  index: 0,
                  name: "Grocery",
                  date: "26 Jan 2023 - 20.55",
                  price: "-\$ 23.56",
                  image: "Grocery",
                  details: 'Corner Grocery',
                ),
                PurchaseTile(
                  index: 0,
                  name: "Riot Games",
                  date: "25 Jan 2023 - 16.40",
                  price: "-\$ 13.20",
                  image: "Riot",
                  details: 'League Of Legends Riot Points Purchase',
                ),
                PurchaseTile(
                  index: 0,
                  name: "Book Shop",
                  date: "20 Jan 2023 - 13.25",
                  price: "-\$ 2.30",
                  image: "Book",
                  details: 'Some Book Purchase',
                ),
                PurchaseTile(
                  index: 0,
                  name: "Food",
                  date: "17 Jan 2023 - 09.13",
                  price: "-\$ 6.70",
                  image: "Hamburger",
                  details: 'Burger King Purchase',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PurchaseTile extends StatelessWidget {
  const PurchaseTile({
    required this.index,
    super.key,
    required this.name,
    required this.date,
    required this.price,
    required this.image,
    required this.details,
  });

  final int index;
  final String name;
  final String date;
  final String price;
  final String image;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PurchaseInfo(
                      name: name,
                      details: details,
                      price: price,
                      image: image,
                      date: date)));
        },
        iconColor: const Color.fromARGB(255, 235, 250, 252),
        tileColor: (index % 2 != 0)
            ? const Color.fromARGB(255, 61, 61, 61)
            : Colors.transparent,
        horizontalTitleGap: 20,
        contentPadding: const EdgeInsets.all(10) +
            const EdgeInsets.symmetric(horizontal: 15),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        leading: Image.asset(
          'images/$image.png',
          color: const Color.fromARGB(255, 230, 234, 255),
          height: 40,
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: Text(
          price,
          style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              letterSpacing: -1),
        ),
      ),
    );
  }
}

class PaypalCard extends StatelessWidget {
  const PaypalCard({
    super.key,
    required this.color,
    required this.cardNumber,
    required this.cardName,
  });

  final List<Color> color;
  final String cardNumber;
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      height: 270,
      width: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
              tileMode: TileMode.clamp,
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: color)),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/paypal.png',
              width: 35,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'CARD NUMBER',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
            ),
            Text(
              cardNumber,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 4),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              cardName,
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SettingsPage()));
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  image: const DecorationImage(
                      image: AssetImage('images/me.jpg'), fit: BoxFit.cover)),
            ),
          ),
        ),
      ),
    );
  }
}

class MyColors {
  List<Color> blue = [
    const Color.fromARGB(255, 235, 250, 252),
    const Color.fromARGB(255, 200, 244, 255),
  ];

  List<Color> red = [
    const Color.fromARGB(255, 230, 210, 236),
    const Color.fromARGB(255, 230, 234, 255),
  ];

  List<Color> yellow = [
    const Color.fromARGB(255, 225, 230, 250),
    const Color.fromARGB(255, 240, 240, 220),
  ];
}

class Periods {
  List<Widget> weekly = const [
    ChartColumn(time: 'W1', size: 3),
    ChartColumn(time: 'W2', size: 5),
    ChartColumn(time: 'W3', size: 7),
    ChartColumn(time: 'W4', size: 2),
    ChartColumn(time: 'W5', size: 4),
    ChartColumn(time: 'W6', size: 6),
    ChartColumn(time: 'W7', size: 1),
    ChartColumn(time: 'W8', size: 5),
  ];
  List<Widget> monthly = const [
    ChartColumn(time: 'Jan', size: 6),
    ChartColumn(time: 'Feb', size: 2),
    ChartColumn(time: 'Mar', size: 4),
    ChartColumn(time: 'Apr', size: 5),
    ChartColumn(time: 'May', size: 3),
    ChartColumn(time: 'Jun', size: 7),
    ChartColumn(time: 'Jul', size: 8),
    ChartColumn(time: 'Aug', size: 6),
    ChartColumn(time: 'Sep', size: 2),
    ChartColumn(time: 'Oct', size: 1),
    ChartColumn(time: 'Nov', size: 5),
    ChartColumn(time: 'Dec', size: 3),
  ];
  List<Widget> yearly = const [
    ChartColumn(time: '2023', size: 5),
    ChartColumn(time: '2022', size: 3),
    ChartColumn(time: '2021', size: 4),
    ChartColumn(time: '2020', size: 2),
    ChartColumn(time: '2019', size: 4),
    ChartColumn(time: '2018', size: 6),
    ChartColumn(time: '2017', size: 5),
    ChartColumn(time: '2016', size: 4),
    ChartColumn(time: '2015', size: 8),
    ChartColumn(time: '2014', size: 3),
  ];
}
