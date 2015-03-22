# FSDAirportFlipLabel

<!--[![CI Status](http://img.shields.io/travis/Felix Dumit/FSDAirportFlipLabel.svg?style=flat)](https://travis-ci.org/Felix Dumit/FSDAirportFlipLabel)-->
[![Version](https://img.shields.io/cocoapods/v/FSDAirportFlipLabel.svg?style=flat)](http://cocoadocs.org/docsets/FSDAirportFlipLabel)
[![License](https://img.shields.io/cocoapods/l/FSDAirportFlipLabel.svg?style=flat)](http://cocoadocs.org/docsets/FSDAirportFlipLabel)
[![Platform](https://img.shields.io/cocoapods/p/FSDAirportFlipLabel.svg?style=flat)](http://cocoadocs.org/docsets/FSDAirportFlipLabel)

##Example

![Example](http://URL)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Since it is a `UILabel` subclass you can instantiate it from your storyboard or directly from code.

After instantiated, everytime you change the text of the label it will animate the transition.

You can specify blocks to run when the animation starts/finishes:

```objc
@property (weak, nonatomic) IBOutlet FSDAirportFlipLabel *airportLabel;

self.airportLabel.startedFlippingLabelsBlock = ^{ NSLog(@"started flipping"); };
self.airportLabel.finishedFlippingLabelsBlock = ^{ NSLog(@"Stopped flipping"); };

```

Additionally you can choose to use the flipping sound or not:
`self.airportLabel.useSound = YES;`

You can also specify the fontSize or a fixed lenght (so the label will always have X number or characters.
```objc
self.airportLabel.textSize = 14;
self.airportLabel.fixedLenght = 10; //-1 for variable length
```

You can customize the *background color* and *text color* using the default `flipBackGroundColor` and `flipTextColor` properties.

## Requirements

## Installation

FSDAirportFlipLabel is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "FSDAirportFlipLabel"

## Author

Felix Dumit, felix.dumit@gmail.com

## License

FSDAirportFlipLabel is available under the MIT license. See the LICENSE file for more info.

