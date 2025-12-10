import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';
import '../services/profile_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocProvider(
        create: (context) => ProfileBloc(ProfileService())..add(FetchProfile()),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person, color: Colors.blue),
                            SizedBox(width: 10),
                            Text(
                              'Profile Details',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text('User ID: ${state.profile.userId}'),
                        Text('ID: ${state.profile.id}'),
                        Text('Title: ${state.profile.title}'),
                        Text('Body: ${state.profile.body}'),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is ProfileError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Center(child: Text('Welcome!'));
          },
        ),
      ),
    );
  }
}