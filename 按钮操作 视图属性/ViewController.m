//
//  ViewController.m
//  按钮操作 视图属性
//
//  Created by Zhang Xiangyu on 16/3/24.
//  Copyright © 2016年 Zhang Xiangyu. All rights reserved.
//

#import "ViewController.h"


//枚举类型实质是一个整数 。 它制定了第一个整数后，后面的数字会递增！
typedef enum{
    move_left = 100,
    move_up,
    move_right,
    move_down
}moveDirection;

enum zoomInOrOut{
    zoomIn = 105,
    zoomOut = 106
};

@interface ViewController ()

@property(nonatomic, weak) IBOutlet UIButton * headImageView;

@end

@implementation ViewController



- (IBAction)move:(id)sender
{
    //将 id 类型的sender 转换为 UIButton ＊
    //或者可以直接把 move 方法定义为 - (IBAction)move:(UIButton *)button
    UIButton *button = (UIButton *)sender;
    
    CGRect tmpFrame = self.headImageView.frame;
    switch (button.tag) {
//        case 100:tmpFrame.origin.x -= 5;  break; //左
//        case 101:tmpFrame.origin.y -= 5;  break; //上
//        case 102:tmpFrame.origin.x += 5;  break; //右
//        case 103:tmpFrame.origin.y += 5;  break; //下
        case move_left:tmpFrame.origin.x -= 5;  break; //左
        case move_up:tmpFrame.origin.y -= 5;  break; //上
        case move_right:tmpFrame.origin.x += 5;  break; //右
        case move_down:tmpFrame.origin.y += 5;  break; //下
        default:break;
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.headImageView.frame = tmpFrame;
    [UIView commitAnimations];
}





- (IBAction)zoom:(UIButton *)button
{
/*
    CGRect tmpFrame = self.headImageView.frame;
    if (button.tag == zoomIn)
    {
        tmpFrame.size.height += 10;
        tmpFrame.size.width += 10;
        tmpFrame.origin.x -= 5;
        tmpFrame.origin.y -= 5;
    }
    else
    {
        tmpFrame.size.height -= 10;
        tmpFrame.size.width -= 10;
        tmpFrame.origin.x += 5;
        tmpFrame.origin.y += 5;
    }
    self.headImageView.frame = tmpFrame;
 */
    //或者使用之前讲过的 bounds，只改变 height 和 width即可
    CGRect tmpBounds = self.headImageView.bounds;
    if (button.tag == zoomIn)
    {
        tmpBounds.size.height += 1;
        tmpBounds.size.width += 1;
    }
    else
    {
        tmpBounds.size.height -= 1;
        tmpBounds.size.width -= 1;
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3];
    self.headImageView.bounds = tmpBounds;
    [UIView commitAnimations];
}




@end
