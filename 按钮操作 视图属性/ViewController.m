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

enum rotate{
    rotate_left = 110,
    rotate_right = 111
};

CGFloat deltaAngle = 0;
CGFloat deltaZoomX = 1;
CGFloat deltaZoomY = 1;
CGFloat deltaMoveX = 0;
CGFloat deltaMoveY = 0;

@interface ViewController ()

@property(nonatomic, weak) IBOutlet UIButton * headImageView;

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    //申请内存空间
    //不设置 buttonType
    //UIButton * btn = [[UIButton alloc] init];
    //设置 buttonType
    UIButton * btn =[UIButton buttonWithType:UIButtonTypeCustom];
    
    //确定宽、高、X、Y坐标
    //   1.
    //btn.frame = CGRectMake(50, 50, 152, 152);
    //或者 2.
    CGRect frame; //对 对象的结构体属性变量的成员 不可以直接赋值，但是对 结构体的成员 可以直接赋值
    frame.origin.x = 50;
    frame.origin.y = 50;
    frame.size.width = 152;
    frame.size.height = 152;
    [btn setFrame:frame];
    
    //
    [btn buttonType];
    
    //设置 default 状态的标题 Title
    [btn setTitle:@"HIT ME" forState:UIControlStateNormal];
    
    //设置 default 状态的字体颜色
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //设置 default 状态背景图片
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_01"] forState:UIControlStateNormal];

    //设置 highlighted 状态属性
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_02"] forState:UIControlStateHighlighted];
    
    //把按钮添加到视图
    [self.view addSubview:btn];
    
    
    // 添加按钮的监听方法 （相当于连线） 当按钮发生了 Touch Inside 事件时调用 click 方法
    //传进来的第一个参数是它自己本身，因此会把自己传给 button
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    //替代此前的 headImageView
    self.headImageView = btn;
    
}

- (void)click:(UIButton *)button
{
    NSLog(@" Being click by %@",button);
}



//- (IBAction)move:(id)sender
//{
//    //将 id 类型的 sender 转换为 UIButton ＊
//    //或者可以直接把 move 方法定义为 - (IBAction)move:(UIButton *)button
//    UIButton *button = (UIButton *)sender;
//    
//    CGRect tmpFrame = self.headImageView.frame;
//
//    switch (button.tag) {
////        case 100:tmpFrame.origin.x -= 5;  break; //左
////        case 101:tmpFrame.origin.y -= 5;  break; //上
////        case 102:tmpFrame.origin.x += 5;  break; //右
////        case 103:tmpFrame.origin.y += 5;  break; //下
//        case move_left:tmpFrame.origin.x -= 5;  break; //左
//        case move_up:tmpFrame.origin.y -= 5;  break; //上
//        case move_right:tmpFrame.origin.x += 5;  break; //右
//        case move_down:tmpFrame.origin.y += 5;  break; //下
//        default:break;
//    }
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.3];
//    self.headImageView.frame = tmpFrame;
//    [UIView commitAnimations];
//}





//- (IBAction)zoom:(UIButton *)button
//{
///*
//    CGRect tmpFrame = self.headImageView.frame;
//    if (button.tag == zoomIn)
//    {
//        tmpFrame.size.height += 10;
//        tmpFrame.size.width += 10;
//        tmpFrame.origin.x -= 5;
//        tmpFrame.origin.y -= 5;
//    }
//    else
//    {
//        tmpFrame.size.height -= 10;
//        tmpFrame.size.width -= 10;
//        tmpFrame.origin.x += 5;
//        tmpFrame.origin.y += 5;
//    }
//    self.headImageView.frame = tmpFrame;
// */
//    //或者使用之前讲过的 bounds，只改变 height 和  width 即可
//    CGRect tmpBounds = self.headImageView.bounds;
//    if (button.tag == zoomIn)
//    {
//        tmpBounds.size.height += 1;
//        tmpBounds.size.width += 1;
//    }
//    else
//    {
//        tmpBounds.size.height -= 1;
//        tmpBounds.size.width -= 1;
//    }
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:3];
//    self.headImageView.bounds = tmpBounds;
//    [UIView commitAnimations];
//}


/* 
//错误，这样的话只会在第一次按下时产生变化
- (IBAction)rotate_new:(UIButton *)button
{
    if (button.tag == rotate_left)
    {
        self.headImageView.transform = CGAffineTransformMakeRotation(-M_1_PI/20);
    }
    else
    {
        self.headImageView.transform = CGAffineTransformMakeRotation(M_1_PI/20);
    }
}
*/

- (IBAction)rotate_new:(UIButton *)button
{
    if(button.tag == rotate_left)
        deltaAngle -= M_1_PI/10;
    else
        deltaAngle += M_1_PI/10;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
//1.    self.headImageView.transform = CGAffineTransformMakeRotation(deltaAngle);
//2.
    self.headImageView.transform = CGAffineTransformRotate(self.headImageView.transform, button.tag == rotate_left ? -M_1_PI/10:M_1_PI/10);
    [UIView commitAnimations];
}

- (IBAction)move_new:(UIButton *)button
{
    switch (button.tag) {
        case move_left:deltaMoveX -= 10;break;
        case move_right:deltaMoveX += 10;break;
        case move_up:deltaMoveY -= 10;break;
        case move_down:deltaMoveY += 10;break;
        default: break;
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
//1.    self.headImageView.transform = CGAffineTransformMakeTranslation(deltaMoveX, deltaMoveY);
//2.
    switch (button.tag)
    {
        case move_left:self.headImageView.transform = CGAffineTransformTranslate(self.headImageView.transform, -10, 0);
            break;
        case move_right:self.headImageView.transform = CGAffineTransformTranslate(self.headImageView.transform, 10, 0);
            break;
        case move_up:self.headImageView.transform = CGAffineTransformTranslate(self.headImageView.transform, 0,-10);
            break;
        case move_down:self.headImageView.transform = CGAffineTransformTranslate(self.headImageView.transform, 0, 10);
            break;
        default: break;
    }
    
    [UIView commitAnimations];
    
}

- (IBAction)zoom_new:(UIButton *)button
{
    if (button.tag == zoomIn) {
        deltaZoomX *= 1.1;
        deltaZoomY *= 1.1;
    }
    else
    {
        deltaZoomX /= 1.1;
        deltaZoomY /= 1.1;
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
//1.    self.headImageView.transform = CGAffineTransformMakeScale(deltaZoomX, deltaZoomY);
//2.
    self.headImageView.transform = CGAffineTransformScale(self.headImageView.transform, button.tag == zoomIn ? 1.1 : 1/1.1,button.tag == zoomIn? 1.1 : 1/1.1);
    [UIView commitAnimations];
}


@end
