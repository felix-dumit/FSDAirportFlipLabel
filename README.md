# FSDAirportFlipLabel

<!--[![CI Status](http://img.shields.io/travis/felix-dumit/FSDAirportFlipLabel.svg?style=flat)](https://travis-ci.org/felix-dumit/FSDAirportFlipLabel)-->
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

You can also customize the duration of each flip that will occur when a label is animating a character change.

`CGFloat flipDuration = 0.1f` is the base flipDuration
`CGFloat flipDurationRange = 1.0f` is the range used to calculate the random flip duration that will be used.
The value will be randomly selected between `(flipDuration, (1 + flipDurationRange) * flipDuration )`

The same is possible for the number of flips that happen when a change in character is happening:
`NSInteger numberOfFlips = 10` is the base number of flips
`CGFloat numberOfFlipsRange = 1.0f` is the range used to calculate the random number of flips.
The value will be randomly selected between `(numberOfFlips, (1 + numberOfFlipsRange) * numberOfFlips )`


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

