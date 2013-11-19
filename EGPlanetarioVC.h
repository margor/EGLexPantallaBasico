//
//  EGPlanetarioVC.h
//  EGLexPantallaBasico
//
//  Created by Esther Gordo Ramos on 18/11/13.
//
//

#import <UIKit/UIKit.h>

@interface EGPlanetarioVC : UIViewController

@property (strong,nonatomic) CALayer *orbitaLayer;
@property (strong,nonatomic) CALayer *tierraLayer;
- (IBAction)animarButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *sunImageView;
- (IBAction)crearEstrellasButton:(id)sender;


@end
