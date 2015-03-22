//
//  AirportFlipLabel.h
//  MyAnimations
//
//  Created by Felix Dumit on 3/25/14.
//  Copyright (c) 2014 Felix Dumit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSDAirportFlipLabel : UILabel

/**
 *  Whether to play sound while flipping labels
 */
@property (assign, nonatomic) BOOL useSound;

/**
 *  The font size
 */
@property (assign, nonatomic) NSInteger textSize;

/**
 *  Optional fixed lenght for number of characters in label
 */
@property (assign, nonatomic) NSInteger fixedLenght;

/**
 *  If there are any labels flipping
 */
@property (readonly, nonatomic) BOOL flipping;

/**
 *  Block called when the last label stops flipping
 */
@property (nonatomic, copy) void (^finishedFlippingLabelsBlock)(void);

/**
 *  Block called when the labels start flipping
 */
@property (nonatomic, copy) void (^startedFlippingLabelsBlock)(void);

/**
 *  The flipping label's text color
 */
@property (strong, nonatomic) UIColor *flipTextColor;


/**
 *  The flipping label's background color
 */
@property (strong, nonatomic) UIColor *flipBackGroundColor;


@end
