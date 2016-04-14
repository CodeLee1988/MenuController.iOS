//
//  EEFloatingPaneTabButton.m
//  menu-controller-example
//
//  Created by Volodymyr Shevchyk Jr. on 13/04/16.
//  Copyright © 2016 Indeema Software Inc. All rights reserved.
//

#import "EEFloatingPaneTabButton.h"
#import "EEMenuTab.h"

#define ICON_IMAGE_SIZE 14.0f

@interface EEFloatingPaneTabButton() {
    CAShapeLayer *_segmentLayer;
    UIImageView *_imageView;
    UILabel *_titleLabel;
}

- (void)updateHighlightedState;
- (CAShapeLayer*)segmentLayer;
- (UIImageView*)imageView;
- (UILabel*)titleLabel;

@end

@implementation EEFloatingPaneTabButton

#pragma mark - Public methods
- (id)initWithMenuTabType:(EEMenuTab*)menuTab tab:(NSUInteger)tabIndex {
    self = [super initWithFrame:CGRectMake(0.0f, 0.0f, SIDE_BAR_ITEM_WIDTH, SIDE_BAR_WIDTH)];
    if (self) {
        _menuTab = menuTab;
        _tabIndex = tabIndex;
        
        [self.titleLabel setText:_menuTab.title];
        
        [self.imageView setImage:_menuTab.icon];
        [self.imageView setHighlightedImage:_menuTab.selectedIcon];
        
        [self setExclusiveTouch:YES];
        
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

+ (instancetype)buttonWithMenuTabType:(EEMenuTab*)menuTab tab:(NSUInteger)tabIndex {
    return [[EEFloatingPaneTabButton alloc] initWithMenuTabType:menuTab tab:tabIndex];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return CGPathContainsPoint(self.segmentLayer.path, 0, point, YES);
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self updateHighlightedState];
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    [self updateHighlightedState];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self updateHighlightedState];
}

- (void)updateBackgroundTo:(EEMenuFloatingMenuSide)side {
    if (side == EEMenuFloatingMenuSideLeft) {
        [self.segmentLayer setTransform:CATransform3DScale(CATransform3DMakeRotation(0, 0, 0, 0), 1, 1, 1)];
    } else {
        [self.segmentLayer setTransform:CATransform3DScale(CATransform3DMakeRotation(0, 0, 0, 0), -1, 1, 1)];
    }
}

- (void)drawBackgroundWithPath:(CGPathRef)path {
    self.segmentLayer.path = path;
    self.segmentLayer.frame = CGPathGetPathBoundingBox(path);
    self.segmentLayer.bounds = CGPathGetPathBoundingBox(path);
}

#pragma mark - Private methods
- (void)updateHighlightedState {
    BOOL lIsHighlighted = self.isSelected || self.isHighlighted;
    
//    [self.backgroundImageView setHighlighted:lIsHighlighted];
    [self.imageView setHighlighted:lIsHighlighted];
    [self.titleLabel setHighlighted:lIsHighlighted];
    
    if (lIsHighlighted) {
        [self.titleLabel setShadowOffset:CGSizeMake(0.0f, 0.5f)];
        [self.titleLabel setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.2f]];
    } else {
        [self.titleLabel setShadowOffset:CGSizeMake(0.0f, 0.0f)];
        [self.titleLabel setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.0f]];
    }
}

- (CAShapeLayer*)segmentLayer {
    if (_segmentLayer == nil) {
        _segmentLayer = [[CAShapeLayer alloc] init];
        [_segmentLayer setFillColor:[UIColor whiteColor].CGColor];
        [_segmentLayer setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.3f].CGColor];
        [_segmentLayer setShadowOpacity:1.0f];
        [_segmentLayer setShadowRadius:1.0f];
        [_segmentLayer setShadowOffset:CGSizeMake(0.0f, 0.0f)];
        
        [self.layer insertSublayer:_segmentLayer atIndex:0];
    }
    return _segmentLayer;
}

- (UIImageView*)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(6.0f, (SIDE_BAR_WIDTH - ICON_IMAGE_SIZE) / 2.0f, ICON_IMAGE_SIZE, ICON_IMAGE_SIZE)];
        [self addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel*)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.imageView.frame) + 2.0f, (SIDE_BAR_WIDTH - ICON_IMAGE_SIZE) / 2.0f, SIDE_BAR_ITEM_WIDTH - CGRectGetMaxX(self.imageView.frame) - ICON_IMAGE_SIZE, ICON_IMAGE_SIZE)];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        [_titleLabel setTextColor:[UIColor colorWithRed:0.1333f green:0.2274f blue:0.3529f alpha:1.0f]];
        [_titleLabel setHighlightedTextColor:[UIColor colorWithRed:0.2274f green:0.5333f blue:1.0f alpha:1.0f]];
        [_titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [_titleLabel setAdjustsFontSizeToFitWidth:YES];
        [_titleLabel setMinimumScaleFactor:0.8f];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

@end
