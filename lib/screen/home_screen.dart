import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/Users.dart';

import '../providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _isLoading = false;

    Future.delayed(Duration.zero, () {
      fetchData();
    });

    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      UsersProvider usersProvider =
          Provider.of<UsersProvider>(context, listen: false);
      await usersProvider.fetchUserData();
    } catch (e) {
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!_isLoading) {
        fetchData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "API Data",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Consumer<UsersProvider>(builder: (context, usersProvider, _) {
          Users? userData = usersProvider.userData;

          if (_isLoading &&
              (userData == null ||
                  userData.products == null ||
                  userData.products!.isEmpty)) {
            return Center(child: CircularProgressIndicator());
          } else if (userData == null ||
              userData.products == null ||
              userData.products!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return ListView.builder(
              controller: _scrollController,
              itemCount: _isLoading
                  ? userData.products!.length + 1
                  : userData.products!.length,
              itemBuilder: (context, index) {
                if (index < userData.products!.length) {
                  final product = userData.products![index];
                  return ListTile(
                    title: Text(product.title ?? ''),
                    subtitle: Text(product.price.toString()),
                  );
                } else if (usersProvider.userStatus == Status.UNSUCESSFUL) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    final scaffold = ScaffoldMessenger.of(context);
                    scaffold.showSnackBar(SnackBar(
                        content: Text("Failed to fetch data from api")));
                  });
                  return Center(child: Text('Failed to fetch data'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            );
          }
        }));
  }
}
