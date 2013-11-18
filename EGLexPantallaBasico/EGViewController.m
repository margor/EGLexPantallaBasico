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
    
    
        [UIImageView animateWithDuration:0.5 animations:^{
            //recognizer.enabled = NO;
            self.circulo.center = CGPointMake(CGRectGetMaxX(self.view.bounds),CGRectGetMaxY(self.view.bounds));//(320, 480);
        } completion:^(BOOL finished) {
            [UIImageView animateWithDuration:0.5 animations:^{
                self.circulo.center = CGPointMake(CGRectGetMaxX(self.view.bounds),CGRectGetMinY(self.view.bounds));;
            } completion:^(BOOL finished) {
                [UIImageView animateWithDuration:0.5 animations:^{
                    self.circulo.center = CGPointMake(CGRectGetMidX(self.view.bounds),CGRectGetMidY(self.view.bounds));;
                } completion:^(BOOL finished) {
                    //recognizer.enabled = YES;
                }];
            }];
        }];

    
    
    
}
@end
