import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paymentapp/firstpage.dart';

class PurchaseInfo extends StatelessWidget {
  const PurchaseInfo({Key? key, required this.name, required this.details, required this.price, required this.image, required this.date}) : super(key: key);

  final String name;
  final String details;
  final String price;
  final String image;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: 30,
        ),
      ), title: const Text('PAYPAL'),backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        tileMode: TileMode.clamp,
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: MyColors().red
                    )
                ),
                child: Align(child: Text(date,style: const TextStyle(fontSize: 20,letterSpacing: 1),),),
              ),
              Positioned(
                  top: 225,
                  left: (MediaQuery.of(context).size.width-150)/2,
                  child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: MyColors().red,
                    ),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const [ BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 10),
                      blurRadius: 15,
                      spreadRadius: 0

                    )],
                  ),
                  child: Image.asset('images/$image.png',color: Colors.black, height: 40,))),
            ],
          ),
          const SizedBox(height: 100,),
          Text(name.toUpperCase(), style: const TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 4),),
          Text(details,style: const TextStyle(fontSize: 16,color: Colors.white38),),
          const SizedBox(height: 20,),
           Text(price,style: const TextStyle(fontSize: 30,color: Colors.red,fontWeight: FontWeight.w100),),
          const SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                      end: Alignment.topLeft,
                      colors: MyColors().red
                  )
                ),
                child: const Center(child: Text('See Receipt',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: MyColors().red
                    )
                ),
                child: const Center(child: Text('Card Details',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
