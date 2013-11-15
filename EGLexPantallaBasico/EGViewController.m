//
//  EGViewController.m
//  EGLexPantallaBasico
//
//  Created by Esther Gordo Ramos on 15/11/13.
//
//

#import "EGViewController.h"

@interface EGViewController ()

@end

@implementation EGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer * gesto = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(animacionMovimiento:)];
    [self.view addGestureRecognizer:gesto];
    
}

-(void)animacionMovimiento: (UIGestureRecognizer*) recognizer {
    
    UIDevice *mobilete = [UIDevice currentDevice];
    if (mobilete.orientation == UIDeviceOrientationPortrait) {
        [UIImageView animateWithDuration:0.5 animations:^{
            //recognizer.enabled = NO;
            self.circulo.center = CGPointMake(CGRectGetMaxX(self.view.frame),CGRectGetMaxY(self.view.frame));//(320, 480);
        } completion:^(BOOL finished) {
            [UIImageView animateWithDuration:0.5 animations:^{
                self.circulo.center = CGPointMake(CGRectGetMaxX(self.view.frame),CGRectGetMinY(self.view.frame));;
            } completion:^(BOOL finished) {
                [UIImageView animateWithDuration:0.5 animations:^{
                    self.circulo.center = CGPointMake(CGRectGetMidX(self.view.frame),CGRectGetMidY(self.view.frame));;
                } completion:^(BOOL finished) {
                    //recognizer.enabled = YES;
                }];
            }];
        }];
    }
    else if ((mobilete.orientation == UIDeviceOrientationLandscapeLeft)||(mobilete.orientation==UIDeviceOrientationLandscapeRight)){
        [UIImageView animateWithDuration:0.5 animations:^{
            //recognizer.enabled = NO;
            self.circulo.center = CGPointMake(CGRectGetMaxY(self.view.frame),CGRectGetMaxX(self.view.frame));//(320, 480);
        } completion:^(BOOL finished) {
            [UIImageView animateWithDuration:0.5 animations:^{
                self.circulo.center = CGPointMake(CGRectGetMaxY(self.view.frame),CGRectGetMinX(self.view.frame));;
            } completion:^(BOOL finished) {
                [UIImageView animateWithDuration:0.5 animations:^{
                    self.circulo.center = CGPointMake(CGRectGetMidY(self.view.frame),CGRectGetMidX(self.view.frame));;
                } completion:^(BOOL finished) {
                    //recognizer.enabled = YES;
                }];
            }];
        }];
    }
    
    
}
@end
