//
//  KWYWViewCell.m
//  DynamicUITableViewCellHeight
//
//  Created by Yongwei on 12/5/13.
//  Copyright (c) 2013 Yongwei. All rights reserved.
//

#import "KWYWViewCell.h"

@interface KWYWViewCell ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation KWYWViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.v = [[UIView alloc] init];
        self.v.frame = CGRectMake(0, 0, self.bounds.size.width, arc4random() % 1000);
        
        [self.contentView addSubview:self.v];
    }
    
    return self;
}

- (void)updateConstraints
{
    [super updateConstraints];
    
    if (self.didSetupConstraints) return;
    
    [self.contentView addConstraint:[NSLayoutConstraint
                                     constraintWithItem:self.v
                                     attribute:NSLayoutAttributeLeading
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.contentView
                                     attribute:NSLayoutAttributeLeading
                                     multiplier:1.0f
                                     constant:0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint
                                     constraintWithItem:self.v
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.contentView
                                     attribute:NSLayoutAttributeTop
                                     multiplier:1.0f
                                     constant:0]];
  
    [self.contentView addConstraint:[NSLayoutConstraint
                                     constraintWithItem:self.v
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.contentView
                                     attribute:NSLayoutAttributeTrailing
                                     multiplier:1.0f
                                     constant:0]];
    
    [self.contentView  addConstraint:[NSLayoutConstraint
                                      constraintWithItem:self.v
                                      attribute:NSLayoutAttributeBottom
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.contentView
                                      attribute:NSLayoutAttributeBottom
                                      multiplier:1.0f
                                      constant:0]];
    
    self.didSetupConstraints = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
