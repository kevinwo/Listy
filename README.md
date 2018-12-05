[![Build Status](https://travis-ci.org/kevinwo/Listy.svg?branch=master)](https://travis-ci.org/kevinwo/Listy)
[![codecov](https://codecov.io/gh/kevinwo/Listy/branch/master/graph/badge.svg)](https://codecov.io/gh/kevinwo/Listy)

# Listy

Listy is yet another cross-platform to-do list app. You can add and delete lists and add and delete tasks. It truly is a productivity wonder.

## Why another to-do app?

I wanted to demonstrate an implementation of [VIPER architecture](https://www.objc.io/issues/13-architecture/viper/) in a cross-platform scenario. There are many VIPER architecture examples in the wild, but I haven't seen any that tackle code reusability. Hence, the birth of Listy, a to-do app that will run on any fruit-labled device. To read more about it, check out my write-up, [Cross-platform VIPER: An app architecture love story](https://medium.com/the-codes/cross-platform-viper-bde42ba0ba43) (publishing soon!).

## Project Structure & Features

The following is a brief breakdown of how I structured my Xcode project, labeled by scheme name:

### Apps

#### Listy iOS

To-do'ing from your iPhone and iPad; iOS 12+

- [x] Create and delete lists and tasks
- [x] View layouts via storyboard
- [x] Scene configuration (i.e. VIPER module setup)
- [x] View routing (i.e. tell view to present/push/dismiss another view)
- [x] Unit tests

#### Listy tvOS

Manage to-dos from the comfort of couch and television; tvOS 12+

- [x] Create and delete lists and tasks
- [x] View layouts via storyboard
- [x] Scene configuration
- [x] View routing
- [ ] Confirm delete before deleting lists and tasks

#### Listy watchOS + extension

To-dos on your wrist; watchOS 5.1+

- [x] Create lists
- [x] View layouts via storyboard
- [x] Scene configuration
- [x] Error alert presentation
- [x] View routing
- [x] Handle view routing output (e.g. present/push/dismiss views)
- [ ] Delete lists
- [ ] Add and delete tasks

#### Listy macOS

To-dos on your Mac; macOS 10.13+

- [x] Create lists
- [x] View layouts via storyboard
- [x] Scene configuration
- [x] Error alert presentation
- [x] View routing
- [ ] Delete lists
- [ ] Add and delete tasks

⚠️ I am not a macOS developer. Please be gentle on UI/UX feedback! 🙏

### Supporting Frameworks

The frameworks are shared code connected to platform-specific implementations of Cocoa Touch frameworks internal to the project

### ListyUI (tvOS/iOS)

Reusable UIKit-driven functionality.

- [x] Configure and update all list and edit views
- [x] Table view data sources and delegates
- [x] Error alert presentation
- [x] Handle view routing output (e.g. present/push/dismiss views)

### ListyKit (all)

Reusable Foundation-driven functionality.

- [x] Read/write lists and tasks
- [x] Presentation logic for all views (i.e. know when to present and update UI)
- [x] View routing protocols
- [x] Error handling

## Setup

- Clone this repository: `https://github.com/kevinwo/Listy.git`
- Build for any app scheme in the Listy.xcodeproj.
- Run and enjoy.

## Test Suite

### Apps

A standard `Cmd+U` on any app scheme in Xcode will run 
the app tests. (watchOS app tests are not yet in place 😬)

### Frameworks

Select an iOS framework scheme (e.g. ListyKit iOS, ListyUI tvOS) to run framework tests.

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

* [Architecting iOS Apps with VIPER](https://www.objc.io/issues/13-architecture/viper/)
* [Picking an OSS license for your iOS app](https://blog.lazerwalker.com/cortado/2015/07/05/open-source-licenses.html)