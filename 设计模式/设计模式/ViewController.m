//
//  ViewController.m
//  设计模式
//
//  Created by zachary spark on 2019/5/13.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ViewController.h"
#import "CommandMainVC.h"
#import "AdapterMainVC.h"
#import "FactoryMethodVC.h"
#import "CelueVC.h"
#import "BuilderVC.h"
#import "TemplateVC.h"
#import <Masonry.h>
#import "ObserverVC.h"
#import "IteratorVC.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *Array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.Array = [[NSMutableArray alloc]init];
    
    [self.Array addObject:@"命令模式"];
    [self.Array addObject:@"适配器模式"];
    [self.Array addObject:@"工厂方法模式"];
    [self.Array addObject:@"策略模式"];
    [self.Array addObject:@"构建者模式"];
    [self.Array addObject:@"模版方法模式"];
    [self.Array addObject:@"观察者模式"];
    [self.Array addObject:@"迭代器模式"];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.Array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellId = @"DesignPatternindentifer";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.textLabel.text = [self.Array objectAtIndex:indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[[CommandMainVC alloc]init] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[[AdapterMainVC alloc]init] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[[FactoryMethodVC alloc]init] animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:[[CelueVC alloc]init] animated:YES];
            break;
        case 4:
            [self.navigationController pushViewController:[[BuilderVC alloc]init] animated:YES];
            break;
        case 5:
            [self.navigationController pushViewController:[[TemplateVC alloc]init] animated:YES];
            break;
        case 6:
            [self.navigationController pushViewController:[[ObserverVC alloc]init] animated:YES];
            break;
        case 7:
            [self.navigationController pushViewController:[[IteratorVC alloc]init] animated:YES];
            break;
        default:
            break;
    }
}

@end
