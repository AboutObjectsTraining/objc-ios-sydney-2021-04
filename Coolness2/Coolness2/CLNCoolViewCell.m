// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewCell.h"

const UIEdgeInsets CLNTextInsets = {
    .top = 7,
    .bottom = 8,
    .left = 12,
    .right = 12
};

IB_DESIGNABLE
@interface CLNCoolViewCell ()
@property (getter=isHighlighted, nonatomic) BOOL highlighted;
@property (class, readonly, nonatomic) NSDictionary *textAttributes;

@property (nonatomic) IBInspectable CGFloat cornerRadius;
@end

@implementation CLNCoolViewCell

- (instancetype)initWithOrigin:(CGPoint)origin color:(UIColor *)color {
    CLNCoolViewCell *newCell = [self initWithFrame:CGRectMake(origin.x, origin.y, 240, 40)];
    newCell.backgroundColor = color;
    return newCell;
}

- (void)configureLayer {
    self.layer.borderWidth = 3;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
}

- (void)configureGestureRecognizers {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bounce)];
    recognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:recognizer];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (!self) return nil;

    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
}

// MARK: - Animation

- (void)bounce {
    NSLog(@"In %s", __func__);
    [self animateBounceWithDuration:1 size:CGSizeMake(120, 240)];
}

- (void)configureAnimationWithSize:(CGSize )size {
    [UIView modifyAnimationsWithRepeatCount:5 autoreverses:YES animations:^{
        CGAffineTransform translation = CGAffineTransformMakeTranslation(size.width, size.height);
        self.transform = CGAffineTransformRotate(translation, M_PI_2);
    }];
}

- (void)animateBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size {
    [UIView animateWithDuration:duration
                     animations:^{ [self configureAnimationWithSize:size]; }
                     completion:^(BOOL finished) { self.transform = CGAffineTransformIdentity; }];
}

// MARK: - Drawing and resizing

// TODO: Cache an instance and return it
+ (NSDictionary *)textAttributes {
    static NSDictionary *attributes;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        attributes = @{ NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
                        NSForegroundColorAttributeName : UIColor.whiteColor };
    });
    return attributes;
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [self.text sizeWithAttributes:self.class.textAttributes];
    newSize.width += CLNTextInsets.left + CLNTextInsets.right;
    newSize.height += CLNTextInsets.top + CLNTextInsets.bottom;
    return newSize;
}

- (void)drawRect:(CGRect)rect {
    CGPoint origin = { CLNTextInsets.left, CLNTextInsets.top };
    [self.text drawAtPoint:origin withAttributes:self.class.textAttributes];
}


// MARK: - UIResponder methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.superview bringSubviewToFront:self];
    self.highlighted = YES;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:nil];
    CGPoint prevLocation = [touch previousLocationInView:nil];
    
    CGFloat deltaX = currLocation.x - prevLocation.x;
    CGFloat deltaY = currLocation.y - prevLocation.y;
    
    self.frame = CGRectOffset(self.frame, deltaX, deltaY);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

@end
