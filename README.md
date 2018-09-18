
# TODO
[ ] state management using scoped models https://proandroiddev.com/you-might-not-need-redux-the-flutter-edition-9c11eba006d7

[ ] 

# how to add firebase to flutter project:
[ ] assuming flutter and firebase/firestore console project created
[ ] console: register flutter project on both ios and android side
[ ] ios: ios bundle id is required.  to do this open <project root>/ios/Runner.xcworkspace .
[ ] ios: download googleService-Info.plist. save it where the Info.plist and AppDelegate file is located
[ ] ios: make sure there is a podfile. run "pod setup",  "pod install" to create a podfile at the ios root directory.  make sure the podfile installs all dependencies
[ ] https://blog.goposse.com/flutter-create-a-back-end-dev-gets-flutter-running-for-the-first-time-3185041bf380
[ ] flutter: update pubspec.yaml by adding the necessary firebase plugin under the "dependencies" section
[ ] flutter: example:  <firebase_plugin> : any
[ ] flutter: run flutter packages get. the plugin should now be available in the global scope
[ ] android: referring to package name is the same as package name in android project
[ ] android: from firebase console download the google-services.json config file. save it where build.gradle is located
https://www.youtube.com/watch?v=DqJ_KjFzL9I