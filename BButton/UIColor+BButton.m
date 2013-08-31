//
//  UIColor+BButton.m
//
//  Created by Mathieu Bolard on 31/07/12.
//  Copyright (c) 2012 Mathieu Bolard. All rights reserved.
//
//  https://github.com/mattlawer/BButton
//
//
//  BButton is licensed under the MIT license
//  http://opensource.org/licenses/MIT
//
//
//  -----------------------------------------
//  Edited and refactored by Jesse Squires on 2 April, 2013.
//
//  http://github.com/jessesquires/BButton
//
//  http://hexedbits.com
//

#import "UIColor+BButton.h"

@implementation UIColor (BButton)

#pragma mark - Custom colors
+ (UIColor *)defaultColorV2
{
    return [UIColor colorWithRed:0.85f green:0.85f blue:0.85f alpha:1.00f];
}

+ (UIColor *)defaultColorV3
{
    return [UIColor colorWithHue:0.0f saturation:0.0f brightness:0.92f alpha:1.0f];
}

+ (UIColor *)primaryColorV2
{
    return [UIColor colorWithRed:0.00f green:0.33f blue:0.80f alpha:1.00f];
}

+ (UIColor *)primaryColorV3
{
    return [UIColor colorWithHue:208.0f/360.0f saturation:0.72f brightness:0.69f alpha:1.0f];
}

+ (UIColor *)infoColorV2
{
    return [UIColor colorWithRed:0.18f green:0.59f blue:0.71f alpha:1.00f];
}

+ (UIColor *)infoColorV3
{
    return [UIColor colorWithHue:194.0f/360.0f saturation:0.59f brightness:0.87f alpha:1.0f];
}

+ (UIColor *)successColorV2
{
    return [UIColor colorWithRed:0.32f green:0.64f blue:0.32f alpha:1.00f];
}

+ (UIColor *)successColorV3
{
    return [UIColor colorWithHue:120.0f/360.0f saturation:0.50f brightness:0.72f alpha:1.0f];
}

+ (UIColor *)warningColorV2
{
    return [UIColor colorWithRed:0.97f green:0.58f blue:0.02f alpha:1.00f];
}

+ (UIColor *)warningColorV3
{
    return [UIColor colorWithHue:35.0f/360.0f saturation:0.68f brightness:0.94f alpha:1.0f];
}

+ (UIColor *)dangerColorV2
{
    return [UIColor colorWithRed:0.74f green:0.21f blue:0.18f alpha:1.00f];
}

+ (UIColor *)dangerColorV3
{
    return [UIColor colorWithHue:2.0f/360.0f saturation:0.64f brightness:0.85f alpha:1.0f];
}

+ (UIColor *)inverseColorV2
{
    return [UIColor colorWithRed:0.13f green:0.13f blue:0.13f alpha:1.00f];
}

+ (UIColor *)inverseColorV3
{
    return [UIColor colorWithHue:0.0f saturation:0.0f brightness:0.60f alpha:1.0f];
}

+ (UIColor *)twitterColor
{
    return [UIColor colorWithRed:0.25f green:0.60f blue:1.00f alpha:1.00f];
}

+ (UIColor *)facebookColor
{
    return [UIColor colorWithRed:0.23f green:0.35f blue:0.60f alpha:1.00f];
}

+ (UIColor *)purpleBButtonColor
{
    return [UIColor colorWithRed:0.45f green:0.30f blue:0.75f alpha:1.00f];
}

+ (UIColor *)grayBButtonColor
{
    return [UIColor colorWithRed:0.60f green:0.60f blue:0.60f alpha:1.00f];
}

#pragma mark - Utilities
- (UIColor *)lightenColorWithValue:(CGFloat)value
{
    int totalComponents = CGColorGetNumberOfComponents(self.CGColor);
    BOOL isGreyscale = (totalComponents == 2) ? YES : NO;
    
    CGFloat *oldComponents = (CGFloat *)CGColorGetComponents(self.CGColor);
    CGFloat newComponents[4];
    
    if(isGreyscale) {
        newComponents[0] = oldComponents[0] + value > 1.0 ? 1.0 : oldComponents[0] + value;
        newComponents[1] = oldComponents[0] + value > 1.0 ? 1.0 : oldComponents[0] + value;
        newComponents[2] = oldComponents[0] + value > 1.0 ? 1.0 : oldComponents[0] + value;
        newComponents[3] = oldComponents[1];
    }
    else {
        newComponents[0] = oldComponents[0] + value > 1.0 ? 1.0 : oldComponents[0] + value;
        newComponents[1] = oldComponents[1] + value > 1.0 ? 1.0 : oldComponents[1] + value;
        newComponents[2] = oldComponents[2] + value > 1.0 ? 1.0 : oldComponents[2] + value;
        newComponents[3] = oldComponents[3];
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
    return retColor;
}

- (UIColor *)darkenColorWithValue:(CGFloat)value
{
    int totalComponents = CGColorGetNumberOfComponents(self.CGColor);
    BOOL isGreyscale = (totalComponents == 2) ? YES : NO;
    
    CGFloat *oldComponents = (CGFloat *)CGColorGetComponents(self.CGColor);
    CGFloat newComponents[4];
    
    if(isGreyscale) {
        newComponents[0] = oldComponents[0] - value < 0.0 ? 0.0 : oldComponents[0] - value;
        newComponents[1] = oldComponents[0] - value < 0.0 ? 0.0 : oldComponents[0] - value;
        newComponents[2] = oldComponents[0] - value < 0.0 ? 0.0 : oldComponents[0] - value;
        newComponents[3] = oldComponents[1];
    }
    else {
        newComponents[0] = oldComponents[0] - value < 0.0 ? 0.0 : oldComponents[0] - value;
        newComponents[1] = oldComponents[1] - value < 0.0 ? 0.0 : oldComponents[1] - value;
        newComponents[2] = oldComponents[2] - value < 0.0 ? 0.0 : oldComponents[2] - value;
        newComponents[3] = oldComponents[3];
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
    return retColor;
}

- (BOOL)isLightColor
{
    int totalComponents = CGColorGetNumberOfComponents(self.CGColor);
    BOOL isGreyscale = (totalComponents == 2) ? YES : NO;
    
    CGFloat *components = (CGFloat *)CGColorGetComponents(self.CGColor);
    CGFloat sum;
    
    if(isGreyscale) {
        sum = components[0];
    }
    else {
        sum = (components[0] + components[1] + components[2]) / 3.0f;
    }
    
    return (sum > 0.8f);
}

@end