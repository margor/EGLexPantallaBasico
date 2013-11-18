//
//  EGRedondelLayerVC.m
//  EGLexPantallaBasico
//
//  Created by Esther Gordo Ramos on 16/11/13.
//
//

#import "EGRedondelLayerVC.h"

@interface EGRedondelLayerVC (){
    CALayer *redondelLayer;
    UIImageView *circuloImageView;
    
}

@end

@implementation EGRedondelLayerVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer * gesto = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(animacionMovimiento:)];
    [self.view addGestureRecognizer:gesto];
    
    redondelLayer = [CALayer layer];
    CGFloat radio = 35.0;
    redondelLayer.bounds = CGRectMake(0, 0, radio*2, radio*2);
    redondelLayer.position = CGPointMake(35, 35);
    redondelLayer.anchorPoint = CGPointMake(0.5,0.5);
    redondelLayer.backgroundColor = [UIColor colorWithRed:0.053 green:0.723 blue:0.587 alpha:1.000].CGColor;
    redondelLayer.cornerRadius = radio;
    
    circuloImageView = [[UIImageView alloc]init];
    circuloImageView.bounds = redondelLayer.bounds;
    [self.view addSubview:circuloImageView];
    [circuloImageView.layer addSublayer:redondelLayer];
    
    
    
}

-(void)animacionMovimiento: (UIGestureRecognizer*) recognizer {
    
    
    [UIImageView animateWithDuration:0.5 animations:^{
        //recognizer.enabled = NO;
        circuloImageView.center = CGPointMake(CGRectGetMaxX(self.view.bounds),CGRectGetMaxY(self.view.bounds));//(320, 480);
    } completion:^(BOOL finished) {
        [UIImageView animateWithDuration:0.5 animations:^{
            circuloImageView.center = CGPointMake(CGRectGetMaxX(self.view.bounds),CGRectGetMinY(self.view.bounds));;
        } completion:^(BOOL finished) {
            [UIImageView animateWithDuration:0.5 animations:^{
                circuloImageView.center = CGPointMake(CGRectGetMidX(self.view.bounds),CGRectGetMidY(self.view.bounds));;
            } completion:^(BOOL finished) {
                //recognizer.enabled = YES;
            }];
        }];
    }];
    
    
    
    
}

@end
