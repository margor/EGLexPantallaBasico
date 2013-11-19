//
//  EGPlanetarioVC.m
//  EGLexPantallaBasico
//
//  Created by Esther Gordo Ramos on 18/11/13.
//
//

#import "EGPlanetarioVC.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface EGPlanetarioVC (){
    UIImageView *enterpriseImageView;
    AVAudioPlayer *player;
}

@end

@implementation EGPlanetarioVC
@synthesize orbitaLayer,tierraLayer,sunImageView;


- (void)viewDidLoad
{
    [super viewDidLoad];

    orbitaLayer = [CALayer layer];
    orbitaLayer.bounds = CGRectMake(0, 0, 200, 200);
    orbitaLayer.position = self.view.center;
    //capa.backgroundColor = [UIColor whiteColor].CGColor;
    orbitaLayer.cornerRadius = 100;
    orbitaLayer.borderWidth = 1.5;
    orbitaLayer.borderColor = [UIColor redColor].CGColor;
    
    
    tierraLayer = [CALayer layer];
    tierraLayer.bounds = CGRectMake(0, 0, 50, 50);
    tierraLayer.position = CGPointMake(100,0);
    tierraLayer.backgroundColor = [UIColor blueColor].CGColor;
    tierraLayer.cornerRadius = 25;
    
    
    CALayer *lunaLayer = [CALayer layer];
    lunaLayer.bounds = CGRectMake(0, 0, 10, 10);
    lunaLayer.position = CGPointMake(0, 0);
    lunaLayer.backgroundColor = [UIColor yellowColor].CGColor;
    lunaLayer.cornerRadius = 5;
    
    [self.view.layer addSublayer:orbitaLayer];
    [orbitaLayer addSublayer:tierraLayer];
    [tierraLayer addSublayer:lunaLayer];
    
    enterpriseImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-100, -160, 200, 144)];
    enterpriseImageView.image = [UIImage imageNamed:@"Enterprise.png"];
    [self.view addSubview:enterpriseImageView];
    
    self.view.backgroundColor = [UIColor blackColor];

    
}




#pragma mark - IBAction

- (IBAction)animarButton:(id)sender
{
    
    
    //Animación para el recorrido del enterprise por un path
    CGPoint posicionUno = CGPointMake(CGRectGetMaxX(self.view.bounds),CGRectGetMaxY(self.view.bounds));
    CGPoint posicionDos = CGPointMake(CGRectGetMaxX(self.view.bounds),CGRectGetMinY(self.view.bounds));
    CGPoint posicionTres = CGPointMake(CGRectGetMinX(self.view.bounds),CGRectGetMaxY(self.view.bounds));
    CGMutablePathRef recorridoEnterprisePath = CGPathCreateMutable();
    CGPathMoveToPoint(recorridoEnterprisePath,NULL,-100,-160);
    CGPathAddCurveToPoint(recorridoEnterprisePath,NULL,
                          posicionUno.x,posicionUno.y,
                          posicionDos.x,posicionDos.y,
                          posicionTres.x,posicionTres.y);
    
    CAKeyframeAnimation *recorridoAnimacion = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    recorridoAnimacion.path=recorridoEnterprisePath;
    recorridoAnimacion.duration=5.0;
    
    //Animacion para el giro de la nave a mitad de camino
    CABasicAnimation *rotationPlano = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    float angulo2 = M_PI;
    rotationPlano.toValue = [NSNumber numberWithFloat:angulo2];
    rotationPlano.duration = 3.5;
    rotationPlano.beginTime = 1.5;
    
    
    //AnimationGroup recorrido + giro para Enterprise
    CAAnimationGroup *agrupacionAnimaciones = [CAAnimationGroup animation];
    agrupacionAnimaciones.animations = [NSArray arrayWithObjects:recorridoAnimacion,rotationPlano, nil];
    agrupacionAnimaciones.duration = 5.0;
    // Add the animation to the layer.
    [enterpriseImageView.layer addAnimation:agrupacionAnimaciones forKey:@"position"];

    //Animacion para la tierra y la luna
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    float angulo = 2*360*M_PI/180;
    rotationAnimation.toValue = [NSNumber numberWithFloat:angulo];
    rotationAnimation.duration = 5;
    
    [orbitaLayer addAnimation:rotationAnimation forKey:@"dandovueltas"];
    [tierraLayer addAnimation:rotationAnimation forKey:@"dandovueltas"];
    
    
    NSString *sonidoPath = [[NSBundle mainBundle] pathForResource:@"nave" ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:sonidoPath];
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    player.numberOfLoops = 0;
    
    [player play];
    
}


- (IBAction)crearEstrellasButton:(id)sender
{
    //Creación de estrellas
    int maxXPantallaInt = [NSNumber numberWithFloat:CGRectGetMaxX(self.view.bounds)].floatValue;
    int maxYPantallaInt = [NSNumber numberWithFloat:CGRectGetMaxY(self.view.bounds)].floatValue;
    
    for (int i = 1; i<150; i++) {
        CALayer *estrellasLayer = [CALayer layer];
        
        float coordXAleatoriaFloat = (arc4random()%(maxXPantallaInt));
        float coordYAleatoriaFloat = (arc4random()%(maxYPantallaInt));
        //variable = limite_inferior + rand() % (limite_superior +1 - limite_inferior) ;
        float maxDiamEstrellaFloat = (1+arc4random()%5);
        
        estrellasLayer.bounds = CGRectMake(0, 0, maxDiamEstrellaFloat, maxDiamEstrellaFloat);
        estrellasLayer.position = CGPointMake(coordXAleatoriaFloat, coordYAleatoriaFloat);
        
        estrellasLayer.cornerRadius = maxDiamEstrellaFloat/2;
        estrellasLayer.backgroundColor = [UIColor whiteColor].CGColor;
        [self.view.layer addSublayer:estrellasLayer];
        
    }
    
}
@end
