// First create model using quicktype (json to dart) then remove unnecaasry code from it
// we need a class and a empty array using static method like:

// class CatalogModel {
//   static List<Product> products = [];
// }

// A new class with same name as "Product", we gave above List<Product>
// create default constructor

// class Product {
//   int id;
//   String name;
//   Product({
//     required this.id,
//     required this.name,


// Two named Constructors, prefered name is fromJson/toJson - fromMap/toMap 


//   factory Product.fromMap(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "name": name,
//       };
// }


// then we create a initState inside the statful class above the @override widget build method
// create a method inside the initState() so it will act as an initial state of stateful widget
// after that make the method using async
// load the json using rootbundle.loadstring() and pass the data to variable
// decode it using jsonDecode() and again pass the data
// then assign the decoded data ["products"] to a variable. this "products" is actually the array of objects inside the json file
// then in last part merge both model class and json data and assign it to CatalogModel.products
// finally call setState()


// @override
//   void initState() {
//     super.initState();
//     loadData();
//   }

//   loadData() async {
//     await Future.delayed(const Duration(seconds: 3)); // to avoid errors on screen, it helps to display progress bar in that time
//     final catalogJson = await rootBundle.loadString("assets/data.json");
//     final decodedData = jsonDecode(catalogJson);
//     var productsData = decodedData["products"];
//     CatalogModel.products = List.from(productsData)
//         .map<Product>((products) => Product.fromMap(products))
//         .toList();
//     setState(() {});
//   }



// ListView & GridView Builders takes ItemCount & Item Builder
// ItemCount is always ClassModel.products.lenth
// ItemBuilder requires the products[Index], for that we assign the current index to a variable
// For example: myProductsIndex = CatalogModel.products[index]

// By using single class, just return ListTile, here we simple pass the current index data to a variable 
// above the return (); statement like this.
// if else or conditional statement with ? : method to display progress bar

// child: (CatalogModel.products.isNotEmpty)
//             ? ListView.builder(
//                 itemCount: CatalogModel.products.length,
//                 itemBuilder: (context, index) {
//                   final myproducts = CatalogModel.products[index];
//                   return ListTile(
//                     onTap: () {},
//                     leading: Image.asset("assets/default2.png"),
//                     title: Text(myproducts.name),
//                     subtitle: Text(myproducts.desc),
//                     trailing: Text(
//                       "\$${myproducts.price}",
//                       textScaleFactor: 1.5,
//                       style: const TextStyle(
//                         color: Colors.green,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   );
//                 },
//               )
//             : const Center(
//                 child: CircularProgressIndicator(),
//               ),

    

//In case of GridTile


// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: GridView.builder(
//           itemCount: CatalogModel.products.length,
//           gridDelegate:
//               SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//           itemBuilder: (context, index) {
//             final myProducts = CatalogModel.products[index];
//             return GridTile(
//               child: Text("${myProducts.name}"),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }





// By using multiple classes, we simple return a Class Name inside the ItemBuilder (context, index) {}
// and pass the current index using CatalogModel.products[index] to a constructor that we create in new class
// we can now access all the data using the keyword default constructor and its variable like here it is "products".


  //  SafeArea(
  //   child: (CatalogModel.products.isNotEmpty)
  //       ? ListView.builder(
  //           itemCount: CatalogModel.products.length,
  //               itemBuilder: (context, index) {
  //                 return ItemWidget(
  //                   products: CatalogModel.products[index],
  //                 );
  //               },
  //             )
  //           : const Center(
  //               child: CircularProgressIndicator(),
  //             ),
  //     ),
  //   );


// class ItemWidget extends StatelessWidget {
//   final Product products;
//   const ItemWidget({required this.products});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Card(
//         child: ListTile(
//           onTap: () {},
//           leading: Image.asset("assets/default2.png"),
//           title: Text(products.name),
//           subtitle: Text(products.desc),
//           trailing: Text(
//             "\$${products.price}",
//             textScaleFactor: 1.5,
//             style: const TextStyle(
//               color: Colors.green,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
