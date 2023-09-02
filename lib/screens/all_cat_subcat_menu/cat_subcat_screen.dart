// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sheraa/bloc/app_bloc.dart';
// import 'package:sheraa/resources/commons/app_text.dart';
// import 'package:sheraa/resources/extensions/hex_color.dart';
// import 'package:sheraa/screens/error/error_screen.dart';

// import '../../resources/themes.dart';

// class CatSubcatScreen extends StatefulWidget {

//   CatSubcatScreen({Key? key}) : super(key: key);

//   static const String routeName = '/cat_sub_screen';

//   // static Route route() {
//   //   return MaterialPageRoute(
//   //     settings: const RouteSettings(name: routeName),
//   //     builder: (_) => CatSubcatScreen(response: args),
//   //   );
//   // }

//   @override
//   State<CatSubcatScreen> createState() => _CatSubcatScreenState();
// }

// class _CatSubcatScreenState extends State<CatSubcatScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bloc = BlocProvider.of<AppBloc>(context);

//     // Fire the event with the data
//     bloc.add(LoadAppCategoriePageEvent());

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: APP_BACKGROUND_COLOR,
//         elevation: 2,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios_new,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//             // context.pop();
//           },
//         ),
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             AppTextDisplayMedium(
//               text: "All Category",
//             ),
//           ],
//         ),
//       ),
//       body: SafeArea(
//           child: BlocBuilder<AppBloc, AppState>(
//         builder: (context, state) {
//           if (state is CategoryListingBlocMenuLoaded) {
//             return CategoryListingWidget(state: state);
//           }
//           // else if (state is SelectedCategoryListing) {
//           //   throw UnimplementedError();
//           // }
//           else {
//             // throw UnimplementedError();
//             return ErrorPage();
//           }
//         },
//       )),
//     );
//   }
// }

// class CategoryListingWidget extends StatelessWidget {
//   final CategoryListingBlocMenuLoaded state;
//   const CategoryListingWidget({super.key, required this.state});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//         itemBuilder: (context, index) {
//           if (index > 0) {
//             return Column(
//               children: [
//                 InkWell(
//                   onTap: () {},
//                   child: Container(
//                     height: 150,
//                     color: HexColor.fromHex(
//                         state.response.categories[index].backgroundColor),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: Padding(
//                             padding: EdgeInsets.all(25),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 AppTextDisplayMedium(
//                                     text:
//                                         state.response.categories[index].name),
//                                 // if (state.response.categories[index].subcategory)
//                                 AppTextMedium(
//                                     text: state.response.categories[index]
//                                             .subcategories?.subcategories
//                                             .map((sc) => sc.name)
//                                             .toList()
//                                             .join(", ") ??
//                                         "")
//                               ],
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 1,
//                           child: CachedNetworkImage(
//                             imageUrl: state.response.categories[index]
//                                 .icon, // Replace with your image URL
//                             width: 100,
//                             height: double
//                                 .infinity, // Set the height to double.infinity to take the available height

//                             fit: BoxFit.cover,
//                             // height: 100,
//                             placeholder: (context, url) => const SizedBox(
//                               width: 100,
//                               height: double
//                                   .infinity, // Set the height to double.infinity to take the available height

//                               // height: 100,
//                             ),
//                             errorWidget: (context, url, error) =>
//                                 const Icon(Icons.error),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 // state.response.categories[index].subcategories != null ?
//                 // Container(

//                 // ) : Container()
//               ],
//             );
//           }
//           return Container();
//         },
//         separatorBuilder: (context, index) => const SizedBox(height: 10),
//         itemCount: state.response.categories.length);
//   }
// }
