[![Build Status](https://travis-ci.org/kevinwo/Listy.svg?branch=master)](https://travis-ci.org/kevinwo/Listy)
[![codecov](https://codecov.io/gh/kevinwo/Listy/branch/master/graph/badge.svg)](https://codecov.io/gh/kevinwo/Listy)

# Listy

Listy is yet another multiplatform to-do list app, and it does the most amazing things, like let you add lists and tasks – even delete them – and see what an app with multiple layers might look like. Enjoy!

# Why another to-do app?

There are a number of VIPER architecture examples in the wild, but I had not come across something that shows how VIPER can be applied in a DRY fashion across multiple platforms. Therefore, I decided to put together and share the way I code in the form of a to-do app.

## Apps

### Listy iOS

This is the main iOS app target, consisting of list and edit views for lists and tasks.

### Listy tvOS

This is the main tvOS app target, consisting of list and edit views for lists and tasks.

### Listy watchOS

This is the main watchOS app target, consisting of list and edit views for lists and tasks.

### Listy macOS

This is the main macOS app target, consisting of list and edit views for lists and tasks.

⚠️ I am not a macOS developer. Please go gentle on feedback! 🙏

## Internal Frameworks

### ListyUI

This framework provides most of the UIKit-driven functionality, with fun things like reusable collection-based data sources which you can use across different platforms.

### ListyKit

This framework provides Foundation-driven functionality, and should be usable on iOS, tvOS, watchOS, macOS, anywhere!

## Install

You should just be able to git clone this repository, build, and run/test!