LicensePlistViewController
==

![platforms](https://img.shields.io/badge/platforms-iOS-333333.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](LICENSE)
[![Language: Swift 5.0](https://img.shields.io/badge/swift-5.0-4BC51D.svg?style=flat)](https://developer.apple.com/swift)
[![Version](https://img.shields.io/cocoapods/v/LicensePlistViewController.svg?style=flat)](http://cocoadocs.org/docsets/LicensePlistViewController)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/hsylife/SwiftyPickerPopover)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

LicensePlistViewController is ViewController for [LicensePlist](https://github.com/mono0926/LicensePlist/).

![Screen shot](doc/screenshot1.png)
![Screen shot](doc/screenshot2.png)

## Requirements

* Swift 5.0
* iOS 9.0 or later

If you use Swift 4.0, try to use 1.1.2

## Installation

### CocoaPods

Simply add the following line to your `Podfile`:

```
pod 'LicensePlistViewController'
```

### Cartage

Simply add the following line to your `Cartfile`:

```
github "yhirano/LicensePlistViewController"
```

### Swift Package Manager

Simply add the following line to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/yhirano/LicensePlistViewController.git", from: "2.1.3")
]
```

Alternatively, you can add the package [directly via Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

## Usage

### Install LicensePlist

[Install LicensePlist](https://github.com/mono0926/LicensePlist/#installation).

Example Homebrew:

```
brew install mono0926/license-plist/license-plist
```

### Use license-plist

[Use license-plist](https://github.com/mono0926/LicensePlist/#usage).

Example command:

On the directory same as `Cartfile` or `Pods`, simply execute `license-plist`.

```
license-plist
```

`com.mono0926.LicensePlist.Output` directory will be generated.

### Add refecense

Add reference `com.mono0926.LicensePlist.plist` file and `com.mono0926.LicensePlist` directory to source tree.

![XCode screen shot](doc/xcode.png)

### Call LicensePlistViewController

```swift
let viewController = LicensePlistViewController()
self.navigationController?.pushViewController(viewController, animated: true)
```

## References

* [LicensePlist](https://github.com/mono0926/LicensePlist/)
* [AcknowList](https://github.com/vtourraine/AcknowList)
