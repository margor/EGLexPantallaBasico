//
//  EGAnimationLayerVC.m
//  EGLexPantallaBasico
//
//  Created by Esther Gordo Ramos on 17/11/13.
//
//

#import "EGAnimationLayerVC.h"

@interface EGAnimationLayerVC (){
    CALayer *redondelLayer;
    
}

@end

@implementation EGAnimationLayerVC

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
	// Do any additional setup after loading the view.
    
    UITapGestureRecognizer * gesto = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(animacionMovimiento:)];
    [self.view addGestureRecognizer:gesto];
    
    redondelLayer = [CALayer layer];
    CGFloat radio = 35.0;
    redondelLayer.bounds = CGRectMake(0, 0, radio*2, radio*2);
    redondelLayer.position = CGPointMake(35, 85);
    redondelLayer.anchorPoint = CGPointMake(0.5,0.5);
    redondelLayer.backgroundColor = [UIColor colorWithRed:0.627 green:0.045 blue:0.424 alpha:1.000].CGColor;
    redondelLayer.cornerRadius = radio;
    
    [self.view.layer addSublayer:redondelLayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)animacionMovimiento: (UIGestureRecognizer*) recognizer {
    
    CGPoint posicionUno = CGPointMake(CGRectGetMaxX(self.view.bounds),CGRectGetMaxY(self.view.bounds));
    CGPoint posicionDos = CGPointMake(CGRectGetMaxX(self.view.bounds),CGRectGetMinY(self.view.bounds));
    CGPoint posicionTres = CGPointMake(CGRectGetMidX(self.view.bounds),CGRectGetMidY(self.view.bounds));

    CABasicAnimation *moverRedondelUno = [CABasicAnimation animationWithKeyPath:@"position"];
    moverRedondelUno.fromValue = [NSValue valueWithCGPoint:redondelLayer.position];
    moverRedondelUno.toValue = [NSValue valueWithCGPoint:posicionUno];
    moverRedondelUno.duration = 0.3;
    
    CABasicAnimation *moverRedondelDos = [CABasicAnimation animationWithKeyPath:@"position"];
    moverRedondelDos.fromValue = [NSValue valueWithCGPoint:posicionUno];
    moverRedondelDos.toValue = [NSValue valueWithCGPoint:posicionDos];
    moverRedondelDos.duration = 0.3;
    moverRedondelDos.beginTime = 0.3;

    CABasicAnimation *moverRedondelTres = [CABasicAnimation animationWithKeyPath:@"position"];
    moverRedondelTres.fromValue = [NSValue valueWithCGPoint:posicionDos];
    moverRedondelTres.toValue = [NSValue valueWithCGPoint:posicionTres];
    moverRedondelTres.duration = 0.3;
    moverRedondelTres.beginTime = 0.6;
    redondelLayer.position = posicionTres;
    
    CAAnimationGroup *tresAnimacionesJuntas = [CAAnimationGroup animation];
    tresAnimacionesJuntas.duration = 0.9;
    tresAnimacionesJuntas.animations = [NSMutableArray arrayWithObjects:moverRedondelUno,moverRedondelDos,moverRedondelTres, nil];
    [redondelLayer addAnimation:tresAnimacionesJuntas forKey:nil];

    
    
//---------------------------------
    
    
    
//    NSArray *puntosPosiciones = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:redondelLayer.position],[NSValue valueWithCGPoint:posicionUno],[NSValue valueWithCGPoint:posicionDos],[NSValue valueWithCGPoint:posicionTres], nil];
//    CAAnimationGroup *tresAnimaciones = [CAAnimationGroup animation];
//    tresAnimaciones.duration = 1.5;
//    NSMutableArray *animacionesArray = [[NSMutableArray alloc]init];
//    
//    for (int i = 0; i<puntosPosiciones.count-1; i++) {
//        CABasicAnimation *moverRedondel = [CABasicAnimation animationWithKeyPath:@"position"];
//        moverRedondel.fromValue = [puntosPosiciones objectAtIndex:i];
//        moverRedondel.toValue = [puntosPosiciones objectAtIndex: i+1];
//        moverRedondel.duration = 0.5;
//        moverRedondel.beginTime = 0.5*i-0.5;
//        [animacionesArray addObject:moverRedondel];
//    }
//    
//    tresAnimaciones.animations = animacionesArray;
    

}

@end
