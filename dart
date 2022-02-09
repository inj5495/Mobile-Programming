dart
dart 공식 홈페이지 : https://dart.dev/

dart SDK 2.16 : 2021.02.04에 업데이트 됨. Flutter와 같이 업데이트 되었으며, pub.dev의 search UI를 개선하였고 IDE 통합을 실시하였음.

Dart 2.16
The Dart 2.16 SDK, which launches today alongside Flutter 2.10, continues the transition from legacy Dart CLI tools (dartfmt, dartdoc, etc.) to the new combined dart developer tool. The newly deprecated tools are dartdoc (use dart doc) and dartanalyzer (use dart analyze). In Dart 2.17 we plan on fully removing the dartdoc, dartanalyzer, and pub commands (deprecated in Dart 2.15; use dart pub or flutter pub). For details, see issue #46100.
The 2.16 release also includes a fix for one security vulnerability and two small breaking changes:
The HttpClient API in dart:io allows you to set optional headers for authorization, www-authenticate, cookie, and cookie2. The implementation of redirection logic in SDKs before Dart 2.16 has a vulnerability where these headers — which can contain sensitive information — are passed on when a cross-origin redirect happens. In Dart 2.16 these headers are dropped. For details, see CVE-2022–0451.
The Directory.rename API in dart:io has changed behavior on Windows: it no longer deletes an existing directory matching the target name (issue #47653).
The Platform.packageRoot and Isolate.packageRoot APIs — which are left over from Dart 1.x and nonfunctional in Dart 2.x — have been removed (issue #47769).
To find further details about changes in Dart 2.16, see the changelog.
New support for declaring platform support for pub.dev packages
Dart is designed for portability, and we strive to enable code that runs on the largest selection of platforms. However, occasionally you might create and share packages on pub.dev that have been designed for just one, or a few, platforms. You might have a package that relies on an API that’s available only on a particular operating system, or a package that uses a library like dart:ffi that’s supported only on native platforms and not on the web.
With Dart 2.16 you can now declare the set of supported platforms manually in the pubspec of the package. For example, if your package supports only Windows and macOS, its pubspec.yaml file might look like this:
name: mypackage
version: 1.0.0
platforms:
  windows:
  macos:
dependencies:
The new platforms tag is intended for cases where you are developing a Dart package, and you want to declare support for a different set of platforms from what pub.dev automatically detects. If you’re developing and sharing a Flutter plugin containing host-specific code (for example, Kotlin or Swift), the Flutter plugin tag typically specifies the supported platforms.
New pub.dev search UI
Responding to developer requests, we’ve created better support for searching for packages on pub.dev. The main goal for the changes launching today is to help you identify, and search for, the set of supported platforms. Here’s a view of the new search experience:

Pub.dev search interface with sidebar containing Platforms, SDKs, and Advanced search filters
The new search UI has a search filter sidebar on the left, which you can use to constrain your package search:
Platforms: Select one or more platforms to narrow the search results to only packages that support all those platforms selected.
SDKs: Select Dart or Flutter to limit the results to packages that support the Dart SDK or Flutter SDK, respectively.
Advanced: Additional search options such as filtering to Flutter Favorite packages.
Null safety update
It’s been a few releases since we last talked about null safety, the major language addition that launched a year ago in Dart 2.12. We’ve been astonished by the speed at which the Dart ecosystem has migrated packages to support null safety: As of today, 100% of the top 250 packages — and 96% of the top 1000 — support null safety! Thanks to all package authors who’ve contributed to this great achievement.
We’ve also seen good progress on apps migrating to sound null safety (the state where the app code and all package dependencies have migrated). From our analytics, 71% of all run sessions in the Flutter tool now have fully sound null safety. If you’re an app developer and still haven’t migrated, now is a great time.
Closing comments
We hope you find the new pub.dev search UI useful, and we welcome any feedback you might have. Stay tuned for the next Dart SDK release, which is scheduled for the second quarter of 2022. We’re working on several exciting language features that we hope to release later this year.
