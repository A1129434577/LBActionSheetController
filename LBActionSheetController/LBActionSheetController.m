//
//  LBActionSheetController.m
//  LBActionSheetController
//
//  Created by 刘彬 on 2020/9/17.
//  Copyright © 2020 刘彬. All rights reserved.
//

#import "LBActionSheetController.h"
#import "LBPresentTransitions.h"
#import "LBUIMacro.h"

#define CELL_HEIGHT 60
#define TITLE_HEIGHT 30

@interface LBActionSheetController ()<UITableViewDataSource,UITableViewDelegate>
{
    LBPresentTransitions *_transitions;
}
@property (nonatomic, strong) NSString *alertTitle;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSDictionary *> *> *actionArray;
@end

@implementation LBActionSheetController
- (instancetype)init
{
    return [self initWithTitle:nil];
}
- (instancetype)initWithTitle:(nullable NSString *)title
{
    self = [super init];
    if (self) {
        _transitions = [LBPresentTransitions new];
        _transitions.coverViewType = LBTransitionsCoverViewAlpha0_5;
        _transitions.contentMode = LBTransitionsContentModeBottom;
        self.transitioningDelegate = _transitions;
        self.modalPresentationStyle = UIModalPresentationCustom;
        
        _alertTitle = title;
        
        _actionArray = @[@[].mutableCopy,@[].mutableCopy].mutableCopy;
        
        _titleFont = [UIFont systemFontOfSize:14];
        _titleColor = [UIColor grayColor];
        _defaultTextFont = [UIFont boldSystemFontOfSize:16];
        _cancelTextFont = [UIFont boldSystemFontOfSize:16];
        _cancelTextColor = [UIColor redColor];
        
    }
    return self;
}

- (void)loadView {
    [super loadView];
    self.view.clipsToBounds = YES;

    self.tableView.tableHeaderView = self.titleLabel;
    [self.view addSubview:self.tableView];
    
    self.view.backgroundColor = self.tableView.backgroundColor;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 0)];
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        if (@available(iOS 15.0, *)) {
            tableView.sectionHeaderTopPadding = 0;
        }
        tableView.clipsToBounds = YES;
        tableView.scrollEnabled = NO;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), _alertTitle?TITLE_HEIGHT:CGFLOAT_MIN)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = _titleFont;
        _titleLabel.textColor = _titleColor;
        _titleLabel.text = _alertTitle;
    }
    return _titleLabel;
}


-(void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    self.titleLabel.font = titleFont;
}

-(void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    self.titleLabel.textColor = titleColor;
}


-(void)addActionTitle:(NSString *)actionTitle style:(LBActionSheetActionStyle)style action:(LBActionSheetAction)action{
    NSMutableDictionary *actionDic = [NSMutableDictionary dictionary];
    [actionDic setValue:actionTitle forKey:@"title"];
    [actionDic setValue:action forKey:@"action"];
    NSMutableArray<NSDictionary *> *defaultActionArray = _actionArray[style];
    [defaultActionArray addObject:actionDic];
    
    self.tableView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), (_alertTitle?TITLE_HEIGHT:CGFLOAT_MIN)+CELL_HEIGHT*(_actionArray.firstObject.count+_actionArray.lastObject.count)+[self tableView:self.tableView heightForHeaderInSection:1]);
    self.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.tableView.frame)+LB_SAFE_AREA_BOTTOM_HEIGHT(self));
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.view.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(6, 6)].CGPath;
    self.view.layer.mask = shapeLayer;
    
    [self.tableView reloadData];
}

#pragma mark UITableViewDataSource,UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _actionArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _actionArray[section].count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = NSStringFromClass(self.class);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    if (indexPath.section) {
        cell.textLabel.textColor = self.cancelTextColor;
        cell.textLabel.font = self.cancelTextFont;
        
    }else{
        cell.textLabel.textColor = self.defaultTextColor;
        cell.textLabel.font = self.defaultTextFont;
    }
    NSDictionary *actionDic = self.actionArray[indexPath.section][indexPath.row];
    cell.textLabel.text = actionDic[@"title"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELL_HEIGHT;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section) {
        NSMutableArray<NSDictionary *> *secondArray = self.actionArray[1];
        return secondArray.count?15:CGFLOAT_MIN;
    }
    return CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return CGFLOAT_MIN;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderV = [[UIView alloc] init];
    sectionHeaderV.backgroundColor = [UIColor groupTableViewBackgroundColor];
    if (@available(iOS 13.0, *)) {
        UIColor *backgroundColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
            if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return [UIColor systemGroupedBackgroundColor];
            }
            else {
                return [UIColor blackColor];
            }
        }];
        sectionHeaderV.backgroundColor = backgroundColor;
    }
    return sectionHeaderV;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    __weak typeof(self) weakSelf = self;
    [self dismissViewControllerAnimated:YES completion:^{
        NSDictionary *actionDic = weakSelf.actionArray[indexPath.section][indexPath.row];
        LBActionSheetAction action = actionDic[@"action"];
        if (action) {
            action(actionDic[@"title"]);
        }
    }];
    
}

@end
