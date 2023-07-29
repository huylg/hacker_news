import 'package:flutter/material.dart';
import 'package:hacker_news/main.dart';
import 'package:hacker_news/my_bottom_navigation_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationbar(),
      appBar: AppBar(
        title: const Text('More'),
      ),
      body: ListView(children: [
        SwitchListTile(
          value: Theme.of(context).brightness == Brightness.dark,
          onChanged: (value) {},
          title: const Text('Dark mode'),
        ),
        const Divider(),
        const ListTile(
          title: Text('Rate this app'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          title: const Text('Star on Github'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => launchUrlString(''),
        ),
        const ListTile(
          title: Text('Report a bug'),
          trailing: Icon(Icons.chevron_right),
        ),
        const Divider(),
        ListTile(
          title: const Text('Created by'),
          trailing: const Text('@huylg'),
          onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => SizedBox(
                    height: 200,
                    child: Center(
                      child: Column(
                        children: [
                          TextButton(
                            child: const Text('Github'),
                            onPressed: () =>
                                launchUrlString('https://github.com/huylg'),
                          ),
                          TextButton(
                            child: const Text('Twitter'),
                            onPressed: () =>
                                launchUrlString('https://twitter.com/huylg_'),
                          ),
                          TextButton(
                            child: const Text('Linkedin'),
                            onPressed: () => launchUrlString(
                                'https://www.linkedin.com/in/huy-ly-82b053170/'),
                          ),
                        ],
                      ),
                    ),
                  )),
        ),
        ListTile(
          title: const Text('Version'),
          trailing: FutureBuilder(
              initialData: '1.0.0+1',
              future: packageInfoCahed.future
                  .then((value) => '${value.version}+${value.buildNumber}'),
              builder: (context, snapshot) => Text(snapshot.requireData)),
        ),
      ]),
    );
  }
}
