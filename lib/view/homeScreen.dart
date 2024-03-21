import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../models/BookListResponse.dart';
import '../network/apiConstants.dart';
import '../providers/homeProvider.dart';
import '../utilites/customBackButton.dart';
import '../utilites/customDropdown.dart';
import '../utilites/customText.dart';
import '../utilites/customTextButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: HomeSection(),
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvide, child) {
      return Column(
        children: [TopBarSection(), SearchSection(), ProductSection()],
      );
    });
  }
}

class ProductSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      if (!homeProvider.isLoading) {
        return Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(4),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: (50 / 70)),
            itemCount: homeProvider.bookList.length,
            itemBuilder: (BuildContext context, int index) {
            //  Products products = homeProvider.bookList![index];
            //  return ProductCell(index: index, product: products);
            },
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(child: CircularProgressIndicator()),
        );
      }
    });
  }
}

// class ProductCell extends StatelessWidget {
//   const ProductCell({
//     super.key,
//     required this.product,
//     required this.index,
//   });
//
//   final Products product;
//   final int index;

  // @override
  // Widget build(BuildContext context) {
  //   return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
  //     return GestureDetector(
  //       onTap: () {
  //         showModalBottomSheet(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return PriceInputBottomSheet(index: index,product: product,);
  //           },
  //         );
  //         //  homeProvider.increaseCount(context,index,product);
  //       },
  //       child: Container(
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(16),
  //             border: Border.all(color: Colors.grey.shade300, width: 1)),
  //         margin: EdgeInsets.all(5),
  //         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Expanded(
  //               child: Image.network(
  //                 '${ApiConstants.imageUrl}${product.image!.trim()}',
  //                 fit: BoxFit.fitWidth,
  //               ),
  //             ),
  //             SizedBox(
  //               width: double.infinity,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   CustomText(
  //                     text: product.productTitle ?? "",
  //                     size: 12,
  //                   ),
  //                   SizedBox(
  //                     height: 4,
  //                   ),
  //                   Row(
  //                     children: [
  //                       Expanded(
  //                         child: CustomText(
  //                           text: '₹${product.price}',
  //                           size: 12,
  //                         ),
  //                       ),
  //                       // GestureDetector(
  //                       //   onTap: () {
  //                       //     showModalBottomSheet(
  //                       //       context: context,
  //                       //       builder: (BuildContext context) {
  //                       //         return PriceInputBottomSheet();
  //                       //       },
  //                       //     );
  //                       //   //  homeProvider.increaseCount(context,index,product);
  //                       //   },
  //                       //   child: Container(
  //                       //       padding: EdgeInsets.all(2),
  //                       //       decoration: BoxDecoration(
  //                       //           color: Colors.green,
  //                       //           borderRadius: BorderRadius.circular(90)),
  //                       //       child: Icon(
  //                       //         Icons.add,
  //                       //         color: Colors.white,
  //                       //       )))
  //                       // Expanded(
  //                       //   child: Row(
  //                       //     mainAxisAlignment: MainAxisAlignment.end,
  //                       //     children: [
  //                       //       GestureDetector(
  //                       //         onTap: () {
  //                       //           homeProvider.decreaseCount(context,index,product);
  //                       //         },
  //                       //         child: Container(
  //                       //             padding: EdgeInsets.all(2),
  //                       //             decoration: BoxDecoration(
  //                       //                 color: Colors.red,
  //                       //                 borderRadius: BorderRadius.circular(90)),
  //                       //             child: Icon(
  //                       //               Icons.remove,
  //                       //               color: Colors.white,
  //                       //             )),
  //                       //       ),
  //                       //       Padding(
  //                       //         padding: const EdgeInsets.all(8.0),
  //                       //         child: CustomText(
  //                       //           text: product.quantity.toString(),
  //                       //           size: 16,
  //                       //         ),
  //                       //       ),
  //                       //       GestureDetector(
  //                       //         onTap: () {
  //                       //           homeProvider.increaseCount(context,index,product);
  //                       //         },
  //                       //         child: Container(
  //                       //             padding: EdgeInsets.all(2),
  //                       //             decoration: BoxDecoration(
  //                       //                 color: Colors.green,
  //                       //                 borderRadius: BorderRadius.circular(90)),
  //                       //             child: Icon(
  //                       //               Icons.add,
  //                       //               color: Colors.white,
  //                       //             )),
  //                       //       ),
  //                       //     ],
  //                       //   ),
  //                       // )
  //                     ],
  //                   ),
  //                   // SizedBox(
  //                   //   height: 8,
  //                   // ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               height: 4,
  //             )
  //           ],
  //         ),
  //       ),
  //     );
  //   });
  // }
//}

// class PriceInputBottomSheet extends StatelessWidget {
//
//   final Products product;
//   final int index;
//
//
//   PriceInputBottomSheet({required this.product,required this.index});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
//       return Container(
//         padding:
//             EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//         child: ListView(
//           shrinkWrap: true,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(20),
//               child: CustomDropdown<String>(
//                 hintText: 'Select Unit', // Optional hint text
//                 value: homeProvider.selectedUnit,
//                 // value: selectedValue, // Provide the current selected value
//                 onChanged: (String? value) {
//                   homeProvider.setDropDown(value ?? "",index);
//                   // Handle value changes here
//                 },
//                 items: <String>['Kg', 'No']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//             ),
//             // DropdownButtonFormField<String>(
//             //   value: _selectedUnit,
//             //   hint: Text('Select Unit'),
//             //   onChanged: (String? newValue) {
//             //     // setState(() {
//             //     //   _selectedUnit = newValue;
//             //     // });
//             //   },
//             //   items: <String>['Kg', 'No'].map<DropdownMenuItem<String>>((String value) {
//             //     return DropdownMenuItem<String>(
//             //       value: value,
//             //       child: Text(value),
//             //     );
//             //   }).toList(),
//             // )),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               height: 200,
//               child: Column(
//                 children: <Widget>[
//                   TextField(
//                     controller: homeProvider.quantityController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       labelText: 'Enter Quantity',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   CustomTextButton(
//                     onPressed: () {
//                     //  homeProvider.addToCart(context, index, product);
//                     //  Navigator.pop(context);
//                     },
//                     text: 'Submit',
//                     height: 60,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }

// class PriceInputBottomSheet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.all(20),
//         height: 200,
//         child: Column(
//           children: <Widget>[
//             TextField(
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'Enter Quantity',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             CustomTextButton(
//               onPressed: () {
//                 // Add your submission logic here
//                 Navigator.pop(context);
//               },
//               text: 'Submit', height: 60,)
//           ],
//         ),
//       ),
//     );
//   }
// }

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvide, child) {
      return Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.search),
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  homeProvide.getHomeData();
                },
                controller: homeProvide.searchController,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder
                      .none, // No additional border inside the container
                  // contentPadding: EdgeInsets.symmetric(horizontal: 12), // Padding for text input
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     homeProvide.clearText();
            //   },
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //     child: Image.asset(
            //       AppAssets.cross,
            //       height: 20,
            //       color: Colors.grey.shade400,
            //     ),
            //   ),
            // )
          ],
        ),
      );
    });
  }
}

class TopBarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.all(8.0),
          child: CustomBackButton(onPressed: () {
            Get.back();
          }),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: CustomText(
              text: "Choose your books",
              color: Colors.black.withOpacity(0.9),
              size: 16,
              weight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: (){

          },
          child: Container(
            height: 50,
            width: 50,
            // margin: const EdgeInsets.all(8.0),
            // child: Card(child: Icon(Icons.shopping_cart_outlined)),
          ),
        )
      ],
    );
  }
}
