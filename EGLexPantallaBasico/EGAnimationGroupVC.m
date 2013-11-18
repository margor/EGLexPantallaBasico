//
//  EGAnimationGroupVC.m
//  EGLexPantallaBasico
//
//  Created by Esther Gordo Ramos on 18/11/13.
//
//

#import "EGAnimationGroupVC.h"

@interface EGAnimationGroupVC (){
    CALayer *redondelLayer;
    
}

@end

@implementation EGAnimationGroupVC

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
    redondelLayer.position = CGPointMake(CGRectGetMidX(self.view.bounds),CGRectGetMidY(self.view.bounds));
    redondelLayer.anchorPoint = CGPointMake(0.5,0.5);
    redondelLayer.backgroundColor = [UIColor colorWithRed:0.906 green:0.779 blue:0.032 alpha:1.000].CGColor;
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
    
    // Animation 1 --- cambio del espesor del borde
    CAKeyframeAnimation* widthAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderWidth"];
    NSArray* widthValues = [NSArray arrayWithObjects:@1.0, @10.0, @5.0, @30.0, @0.5, @15.0, @2.0, @50.0, @0.0, nil];
    widthAnim.values = widthValues;
    widthAnim.calculationMode = kCAAnimationPaced;
    
    // Animation 2 --- cambio de color del borde
    CAKeyframeAnimation* colorAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderColor"];
    NSArray* colorValues = [NSArray arrayWithObjects:(id)[UIColor greenColor].CGColor,
                            (id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor,  nil];
    colorAnim.values = colorValues;
    colorAnim.calculationMode = kCAAnimationPaced;
    
    //Animation 3 --- movimiento por un recorrido de puntos
    CAKeyframeAnimation *positionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSArray *positionValues = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:redondelLayer.position],[NSValue valueWithCGPoint:posicionUno],[NSValue valueWithCGPoint:posicionDos],[NSValue valueWithCGPoint:posicionTres], nil];
    positionAnim.values = positionValues;
    positionAnim.calculationMode = kCAAnimationPaced;
    
    // Animation group --- añadimos las tres animaciones juntas
    CAAnimationGroup* group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:colorAnim, widthAnim, positionAnim, nil];
    group.duration = 1.0;
    
    [redondelLayer addAnimation:group forKey:@"position"];
    
    
    
    
}


@end
