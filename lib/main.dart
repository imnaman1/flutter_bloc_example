import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/blocs/posts_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => PostsBloc(), child: const HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final PostsBloc postsBloc = BlocProvider.of(context);
    postsBloc.add(const FetchUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc Example'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadedState) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(state.postList[index].id),
                    ),
                    title: Text(state.postList[index].title),
                    subtitle: Text(
                      state.postList[index].body,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.postList.length);
          } else if (state is ErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
