//
//  EGTablaMenuCell.h
//  EGLexPantallaBasico
//
//  Created by Esther Gordo Ramos on 18/11/13.
//
//

#import <UIKit/UIKit.h>

@interface EGTablaMenuCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *explicacionTextView;
//@property (weak, nonatomic) IBOutlet UIView *fondoCeldaView;
@property (weak,nonatomic) CALayer *redondelLayerCell;
//@property (weak, nonatomic) IBOutlet UIView *redondelView;
@property (weak, nonatomic) IBOutlet UIImageView *redondelView;

@end
