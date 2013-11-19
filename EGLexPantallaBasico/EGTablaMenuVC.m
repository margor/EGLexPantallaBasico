//
//  EGTablaMenuVC.m
//  EGLexPantallaBasico
//
//  Created by Esther Gordo Ramos on 18/11/13.
//
//

#import "EGTablaMenuVC.h"
#import "EGTablaMenuCell.h"
#import "EGViewController.h"

@interface EGTablaMenuVC (){
    CGFloat altura;
}

@end

@implementation EGTablaMenuVC



- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    altura = CGRectGetMaxY(self.view.bounds)/5;
    return altura;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (EGTablaMenuCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Celda";
    EGTablaMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.row == 0){
        cell.redondelView.backgroundColor = [UIColor orangeColor];
        cell.explicacionTextView.text = @"Pelota con imageView y animación con animateWithDuration";
    }
    
    else if (indexPath.row == 1){
        cell.redondelView.backgroundColor = [UIColor colorWithRed:0.053 green:0.723 blue:0.587 alpha:1.000];
        cell.explicacionTextView.text = @"Pelota con CALayer y animación con animateWithDuration";
    }
    
    else if (indexPath.row == 2){
        cell.redondelView.backgroundColor = [UIColor colorWithRed:0.627 green:0.045 blue:0.424 alpha:1.000];
        cell.explicacionTextView.text = @"Pelota con CALayer y animación con CAAnimationGroup";
    }
    
    else if (indexPath.row == 3){
        cell.redondelView.backgroundColor = [UIColor colorWithRed:0.906 green:0.779 blue:0.032 alpha:1.000];
        cell.explicacionTextView.text = @"Pelota con CALayer y animación con CAAnimationGroup y CAKeyframeAnimation";
    }
    
    else if (indexPath.row == 4){
        cell.redondelView.backgroundColor = [UIColor blackColor];
        cell.explicacionTextView.text = @"Planetario con enterprise y generador de estrellas";
        cell.redondelView.image = [UIImage imageNamed:@"Enterprise.png"];
    }

    cell.explicacionTextView.font = [UIFont fontWithName:@"Helvetica" size:altura/6];
    cell.explicacionTextView.textContainerInset = UIEdgeInsetsMake(0, 5, 5, 2);
    cell.explicacionTextView.textColor = [UIColor blackColor];
    cell.backgroundColor = [UIColor whiteColor];
    float radioRedondel = (altura/2)-17;
    //cell.redondelView.layer.bounds = CGRectMake(0, 0, 10, 10); ¡¡!!!??
    cell.redondelView.layer.cornerRadius = radioRedondel;
    

    //Más abajo...
    //Intento de trabajar con un CALayer desde aquí para dibujar dentro del UIView creado en EGTablaMenuCell. Ante la imposibilidad, directamente cambié UIView por un UIImageView ya que, además de tener dentro un layer, al menos me deja colocar imágenes.
    
//    cell.redondelView.backgroundColor = [UIColor whiteColor];
//    CGFloat radio = 35.0;
//    cell.redondelLayerCell.bounds = CGRectMake(0,0, radio*2, radio*2);
//    cell.redondelLayerCell.cornerRadius = radio;
//    cell.redondelLayerCell.position = CGPointMake(cell.redondelView.bounds.origin.x,cell.redondelView.bounds.origin.y);//CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMidY(self.bounds));
//    cell.redondelLayerCell.backgroundColor = [UIColor yellowColor].CGColor;
//    cell.redondelLayerCell.anchorPoint = CGPointMake(0.5, 0.5);
//    [cell.redondelView.layer addSublayer:cell.redondelLayerCell];
//    //[cell.backgroundView.layer addSublayer:cell.redondelLayerCell];

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    static NSString *CellIdentifier = @"Celda";
//    EGTablaMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    
    if (indexPath.row == 0)
        [self performSegueWithIdentifier:@"irAViewController" sender:indexPath];
    else if (indexPath.row == 1)
        [self performSegueWithIdentifier:@"irARedondelLayer" sender:indexPath];
    else if (indexPath.row == 2)
        [self performSegueWithIdentifier:@"irAAnimationLayer" sender:indexPath];
    else if (indexPath.row == 3)
        [self performSegueWithIdentifier:@"irAAnimationGroup" sender:indexPath];
    else if (indexPath.row == 4)
        [self performSegueWithIdentifier:@"irAPlanetario" sender:indexPath];
    
}

@end
