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

@interface EGTablaMenuVC ()

@end

@implementation EGTablaMenuVC



- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
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
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat altura;
    altura = CGRectGetMaxY(self.view.bounds)/4;
    return altura;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (EGTablaMenuCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Celda";
    EGTablaMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //CALayer *redondelLayerCell = [CALayer layer];
    
    CGFloat radio = 35.0;
    cell.redondelLayerCell.bounds = CGRectMake(0, 0, radio*2, radio*2);
    cell.redondelLayerCell.cornerRadius = radio;
    cell.redondelLayerCell.position = CGPointMake(0, 0);//CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMidY(self.bounds));
    cell.redondelLayerCell.backgroundColor = [UIColor redColor].CGColor;
    cell.redondelLayerCell.anchorPoint = CGPointMake(0.5, 0.5);
    cell.redondelView.bounds = cell.redondelLayerCell.bounds;
    
    
    // Configure the cell...
    if (indexPath.row == 0){
        //cell.redondelLayerCell.backgroundColor = [UIColor orangeColor].CGColor;
        cell.backgroundColor = [UIColor colorWithRed:0.869 green:0.493 blue:0.031 alpha:1.000];
        cell.explicacionTextView.text = @"Pelota con imageView y animación con animateWithDuration";
    }
    else if (indexPath.row == 1){
        cell.redondelLayerCell.backgroundColor = [UIColor colorWithRed:0.053 green:0.723 blue:0.587 alpha:1.000].CGColor;
        cell.tintColor = [UIColor blueColor];
        cell.backgroundColor = [UIColor colorWithRed:0.053 green:0.723 blue:0.587 alpha:1.000];
        cell.explicacionTextView.text = @"Pelota con CALayer y animación con animateWithDuration";

    }
    else if (indexPath.row == 2){
        cell.redondelLayerCell.backgroundColor = [UIColor colorWithRed:0.627 green:0.045 blue:0.424 alpha:1.000].CGColor;
        cell.tintColor = [UIColor magentaColor];
        cell.backgroundColor = [UIColor colorWithRed:0.627 green:0.045 blue:0.424 alpha:1.000];
        cell.explicacionTextView.text = @"Pelota con CALayer y animación con CAAnimationGroup";

    }
    else if (indexPath.row == 3){
        cell.redondelLayerCell.backgroundColor = [UIColor colorWithRed:0.906 green:0.779 blue:0.032 alpha:1.000].CGColor;
        cell.tintColor = [UIColor yellowColor];
        cell.backgroundColor = [UIColor colorWithRed:0.906 green:0.779 blue:0.032 alpha:1.000];
        cell.explicacionTextView.text = @"Pelota con CALayer y animación con CAAnimationGroup y CAKeyframeAnimation";
    }
    [cell.redondelView.layer addSublayer:cell.redondelLayerCell];

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    static NSString *CellIdentifier = @"Celda";
//    EGTablaMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
//        EGViewController *primerVC = [[EGViewController alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//        [self.navigationController pushViewController:primerVC animated:YES];
        [self performSegueWithIdentifier:@"irAViewController" sender:indexPath];

    }
    else if (indexPath.row == 1)
        [self performSegueWithIdentifier:@"irARedondelLayer" sender:indexPath];
    else if (indexPath.row == 2)
        [self performSegueWithIdentifier:@"irAAnimationLayer" sender:indexPath];
    else if (indexPath.row == 3)
        [self performSegueWithIdentifier:@"irAAnimationGroup" sender:indexPath];

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
