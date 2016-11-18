//
//  UITextView+placeHolder.m
//  CPPC
//
//  Created by bwrc on 16/11/16.
//  Copyright © 2016年 bwrc. All rights reserved.
//

#import "UITextView+placeHolder.h"
#import <objc/runtime.h>
static NSString *placeHolderKey ;
static NSString *holderKey ;
@interface UITextView ()<UITextViewDelegate>
@property (nonatomic,strong) UILabel *holderLabel;

@end

@implementation UITextView (placeHolder)

-(void)textChange:(NSNotification *)noti{
    if (self.text.length != 0) {
        self.holderLabel.hidden = true;
    }else{
        self.holderLabel.hidden = false;
    }
}
-(UILabel *)holderLabel{
    return (UILabel *)objc_getAssociatedObject(self, &holderKey);
}
-(void)setHolderLabel:(UILabel *)holderLabel{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:UITextViewTextDidChangeNotification object:self];
    [self addSubview:holderLabel];
    objc_setAssociatedObject(self, &holderKey, holderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
-(NSString *)placeHolder{
    return objc_getAssociatedObject(self, &placeHolderKey);
}
-(void)setPlaceHolder:(NSString *)placeHolder{
    objc_setAssociatedObject(self, &placeHolderKey, placeHolder, OBJC_ASSOCIATION_COPY_NONATOMIC);

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, self.frame.size.width-10, self.frame.size.height - 10)];
    label.text = self.placeHolder;
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:14.0];
    label.numberOfLines = 0;
    [label sizeToFit];
    
    [self setHolderLabel:label];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}
@end
