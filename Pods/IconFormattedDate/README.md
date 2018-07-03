# IconFormattedDate iOS Swift

[![CI Status](https://img.shields.io/travis/killme3/IconFormattedDate.svg?style=flat)](https://travis-ci.org/killme3/IconFormattedDate)
[![Version](https://img.shields.io/cocoapods/v/IconFormattedDate.svg?style=flat)](https://cocoapods.org/pods/IconFormattedDate)
[![License](https://img.shields.io/cocoapods/l/IconFormattedDate.svg?style=flat)](https://cocoapods.org/pods/IconFormattedDate)
[![Platform](https://img.shields.io/cocoapods/p/IconFormattedDate.svg?style=flat)](https://cocoapods.org/pods/IconFormattedDate)

How to convert format date, example from dd/MM/YYYY to MMM dd, yyyy

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- Swift 3
- iOS 8.0+

## Installation

IconFormattedDate is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'IconFormattedDate'
```

# Usage

> add IconFormattedDate to your project. reference http://docs.onemobilesdk.aol.com/ios-ad-sdk/adding-frameworks-xcode.html

```swift
import IconFormattedDate

var formatDate = IconFormattedDate()
let dateNow = self.formatDate.formattedDateFromString(dateFormat: "dd/MM/yyyy", dateString: "24/06/2018", withFormat: "MMM dd, yyyy")
print("today is => \(String(describing: dateNow))")
```

## Author

yanamyn, yana.mulyana@iconpln.co.id

## License

IconFormattedDate is available under the MIT license. See the LICENSE file for more info.
