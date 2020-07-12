# Mancomm Recruitment Site

A [flutter](http://flutter.dev/) web project built to facilitate mancomm registrations of IEEE SBM for the session of 20-21. It includes a landing page with a timeline and a registration page connected to [Firestore](https://firebase.google.com/docs/firestore).

## Setup

- First, clone the repository with the 'clone' command, or just download the zip.

```
$ git clone https://github.com/InfiniteVerma/mancomm-rec
```

- Install dependencies from pubspec.yaml by running `flutter packages get` from the project root

- Enable flutter web. (See [here](https://flutter.dev/docs/get-started/web) for the official guide)

- Create a new [Firebase](https://console.firebase.google.com/) project and replace the contents of ```example-config.js``` file in the ```web/``` folder and rename it to ```config.js```.

## Run

Run you app in Chrome

```
flutter run -d chrome
```

To hot restart (and rebuild state), press "R".

## Quick Changes

To change the content and quickly build your website, most of the strings are stored in a single file at ```lib/data.dart```

## Building with the production JavaScript compiler

To enable the release compiler, run.

```
flutter build web
```

This will create a `build/web` directory with index.html, main.dart.js and the rest of the files needed to run the application using a static HTTP server.

## Deploy

To deploy it, push the ```web/``` directory on your particular hosting service. 

## License
This project is available under the MIT license. See the [LICENSE](https://github.com/InfiniteVerma/mancomm-rec/blob/master/LICENSE) file for more info.

## Acknowledgements
 - [Flutter-Web---Food-App-UI](https://github.com/abuanwar072/Flutter-Web---Food-App-UI)
 - [Flutter Login Page Responsive UI Website with Illustration](https://www.youtube.com/watch?v=U1a1W2oXBFY)