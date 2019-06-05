//
//  MemoVC.m
//  设计模式
//
//  Created by zachary spark on 2019/6/5.
//  Copyright © 2019 3g. All rights reserved.
//

#import "MemoVC.h"
#import "GameCaretaker.h"
#import "GameOriginator.h"
#import "GameJsonOriginator.h"
@interface MemoVC ()<UITableViewDelegate,UITableViewDataSource>
{
    GameOriginator *originator;
    
}
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (strong,nonatomic)NSMutableArray *Array;
@end

@implementation MemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //简单的应用场景，单一的回退，状态层级1层
//    [self sample];
    
    
    //复杂的应用场景  恢复到过去某个时间状态  状态层级2层，组合状态
    [self sample2];
    
}

- (void)sample2{
    
    GameJsonOriginator *JsonOriginator = [[GameJsonOriginator alloc]init];
    
    //游戏过程中保存游戏的通关数据
    [JsonOriginator addGameResultsWithPoint:50 level:1];
    [JsonOriginator addGameResultsWithPoint:100 level:3];
    //保存游戏
    GameJsonMemo *memo = [JsonOriginator CreateGameMemo];
    
    //游戏过程中保存游戏的通关数据
    [JsonOriginator addGameResultsWithPoint:200 level:1];
    [JsonOriginator addGameResultsWithPoint:200 level:1];
    
    [JsonOriginator ShowCurrentTotalPoint];
    
    //我想回退到以前的一个时间点
    [JsonOriginator RestoreMoment:memo];
    
    
    [JsonOriginator ShowCurrentTotalPoint];
    
}


- (void)sample{
    //游戏存档只保留一份
    //初始化数据库
    [GameCaretaker CreateTabeviewDB];
    originator = [GameOriginator new];
    [self UpdateCache];
}


- (void)UpdateCache{
    
    [GameCaretaker SearchModelisFinished:^(BOOL isSuccess, NSArray<GameMemo *> * _Nonnull Array) {
        if(isSuccess){
            self.Array = [[NSMutableArray alloc]initWithArray:Array];
            [self.TableView reloadData];
        }
    }];
    
}


- (IBAction)PlaySuccessDone:(id)sender {
    
    
    
    //游戏通关
    [originator PlayAndSuccess];
    //存档
    GameMemo *memo =[originator CreateMemo];

    
    self.PointLabel.text = [NSString stringWithFormat:@"%ld",memo.point];
    self.LevelLabel.text = [NSString stringWithFormat:@"%ld",memo.level];
    
    
    
//    [GameCaretaker DeleteAllModelisFinished:^(BOOL isSuccess) {
//        if(isSuccess){
            [GameCaretaker saveGzMessage:memo isFinished:^(BOOL isSuccess) {
                if(isSuccess){
                    NSLog(@"%@",@"存档成功");
                    [self UpdateCache];
                }
            }];
//        }
//    }];
    
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
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellId];
    }
    GameMemo*memo =  [self.Array objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",memo.level];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",memo.point];
    return cell;
    
}


//左滑删除 和编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath

{
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
     
        GameMemo *memo = [self.Array objectAtIndex:indexPath.row];
        [GameCaretaker DeleteModel:memo isFinished:^(BOOL isSuccess) {
            if(isSuccess){
                [self.Array removeObject:memo];
                [self.TableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
            }
        }];
        
    }];
    

 return @[deleteAction];
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    editingStyle = UITableViewCellEditingStyleDelete;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    GameMemo *Memo = [self.Array objectAtIndex:indexPath.row];
    self.PointLabel.text = [NSString stringWithFormat:@"%ld",Memo.point];
    self.LevelLabel.text = [NSString stringWithFormat:@"%ld",Memo.level];
    [originator RestoreGameWithMemo:Memo];
    
}

@end
