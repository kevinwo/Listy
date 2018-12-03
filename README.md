[![Build Status](https://travis-ci.org/kevinwo/Listy.svg?branch=master)](https://travis-ci.org/kevinwo/Listy)
[![codecov](https://codecov.io/gh/kevinwo/Listy/branch/master/graph/badge.svg)](https://codecov.io/gh/kevinwo/Listy)

# Listy

Listy is yet another multiplatform to-do list app. You can add and delete lists and add and delete tasks. It truly is a productivity wonder.

## Why another to-do app?

I wanted to demonstrate an implementation of [VIPER architecture](https://www.objc.io/issues/13-architecture/viper/) in a cross-platform scenario. There are many VIPER architecture examples in the wild, but I haven't seen any that tackle code reusability. Hence, the birth of Listy, a to-do app that will run on any fruit-labled device.

## Project Structure & Features

The following is a brief breakdown of how I structured my Xcode project, labeled by scheme name:

### App Targets

#### Listy iOS

To-do'ing from your iPhone and iPad; iOS 12+

#### Listy tvOS

Manage to-dos from the comfort of couch and television; tvOS 12+

#### Listy watchOS

To-dos on your wrist; watchOS 5.1+

#### Listy macOS

To-dos on your Mac.

⚠️ I am not a macOS developer. Please go gentle on UI/UX feedback! 🙏

### Supporting Frameworks

The frameworks are shared code connected to platform-specific implementations of Cocoa Touch frameworks internal to the project

### ListyUI

ListyUI provides reusable UIKit-driven functionality.

- [x] List and task views
- [x] Table view data sources and delegates
- [x] Error alert presentation
- [x] View controller presentation

### ListyKit

ListyKit provides reusable Foundation-driven functionality.

- [x] List and task presenters and interactors
- [x] Entity models and persistence
- [x] Error handling and view routing protocols

## Setup

- Clone this repository.
- Build for any app scheme in the Listy.xcodeproj.
- Run and enjoy.

## License

The source code to Listy is available under the MIT license. See the LICENSE file for more information.

Although technically allowed by the licensing terms, please do not just copy pasta Listy's code and submit your own version to the App Store.

## I am available for hire

and looking for interesting opportunities in New York City. If you like the way I write code, please feel free to get in touch!

## Contact

Kevin Wolkober

* [LinkedIn](https://www.linkedin.com/in/kevinwolkober)
* [GitHub](https://github.com/kevinwo)

## Great Resources

The following items have been very helpful in developing this project:

* [VIPER architecture](https://www.objc.io/issues/13-architecture/viper/)
* [Picking an OSS license for your iOS app](https://blog.lazerwalker.com/cortado/2015/07/05/open-source-licenses.html)