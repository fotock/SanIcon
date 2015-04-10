//
//  SILabel.m
//  SanIcon
//
//  Created by Shelley Shyan on 15-4-7.
//  Copyright (c) 2015年 Sanfriend Co, Ltd.(胜友时代（北京）科技有限公司) All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "SILabel.h"
#import "SanIcon.h"

@implementation SILabel

- (void)drawTextInRect:(CGRect)rect
{
    if (self.iconName + self.iconPadding + self.iconSize + self.iconColor < 1) {
        return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
    }

    CGFloat iconSize = self.iconSize > 0 ? self.iconSize : self.font.pointSize;

    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(self.insets.top, iconSize * 1.2+self.iconPadding, self.insets.bottom, self.insets.right))];

    UILabel *icon = [[UILabel alloc] initWithFrame:CGRectMake(self.insets.left, 0, iconSize, iconSize)];
    icon.text = [NSString sanicon:(SanIcon)self.iconName];

    if (self.iconColor > 0) {
        icon.textColor = [UIColor colorWithRed:(CGFloat)((self.iconColor & 0xFF000000) >> 24) / 255.0
                                         green:(CGFloat)((self.iconColor & 0x00FF0000) >> 16) / 255.0
                                          blue:(CGFloat)((self.iconColor & 0x0000FF00) >> 8) / 255.0
                                         alpha:(CGFloat)((self.iconColor & 0x000000FF)) / 255.0];
    } else {
        icon.textColor = self.textColor;
    }

    icon.font = [UIFont saniconFontOfSize:iconSize];

    CGRect frame = icon.frame;
    frame.origin.y = (self.frame.size.height - frame.size.height)/2;
    icon.frame = frame;

    [self addSubview:icon];
}

@end
