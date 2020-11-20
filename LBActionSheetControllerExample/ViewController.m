//
//  ViewController.m
//  LBActionSheetControllerExample
//
//  Created by 刘彬 on 2020/11/20.
//

#import "ViewController.h"
#import "LBActionSheetController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self showActionSheet];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self showActionSheet];
}
-(void)showActionSheet{
    LBActionSheetController *actionSheet = [[LBActionSheetController alloc] initWithTitle:@"请选择"];
    [actionSheet addActionTitle:@"拍照" style:LBActionSheetActionStyleDefault action:^(NSString * _Nonnull actionTitle) {
            
    }];
    [actionSheet addActionTitle:@"相册" style:LBActionSheetActionStyleCancel action:^(NSString * _Nonnull actionTitle) {
            
    }];
    [self presentViewController:actionSheet animated:YES completion:NULL];
}

@end
