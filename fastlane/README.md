fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

### bump_version

```sh
[bundle exec] fastlane bump_version
```

Bumps pubspec version and creates a commit for the same along with a tag

Params

  flavor:     Flavor to be built dev | uat | prod. Default is dev

Example

bundle exec fastlane bump_version flavor:prod

### release_beta

```sh
[bundle exec] fastlane release_beta
```

Publishes the app to Hostinger, App Center, and Testflight

Params

  flavor:     Flavor to be built dev | uat | prod. Default is dev

Example

bundle exec fastlane release_beta flavor:prod

### hostinger_web

```sh
[bundle exec] fastlane hostinger_web
```

Publishes the web app to Hostinger

Params

  flavor:     Flavor to be built dev | uat | prod. Default is dev

Example

bundle exec fastlane hostinger_web flavor:prod

### appcenter_android

```sh
[bundle exec] fastlane appcenter_android
```

Publishes the app to App Center

Params

  flavor:     Flavor to be built dev | uat | prod. Default is dev

Example

bundle exec fastlane appcenter_android flavor:prod

### testflight_ios

```sh
[bundle exec] fastlane testflight_ios
```

Publishes the IOS app to Testflight for QA

Params

  flavor:                 Flavor to be built uat | prod. Default is dev

Example

bundle exec fastlane testflight_ios flavor:prod

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
