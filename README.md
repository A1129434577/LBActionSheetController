# LBActionSheetController
类似于微信的ActionSheetController。
# 安装方式
```ruby
pod 'LBActionSheetController'
```
# 使用
```Objc
LBActionSheetController *actionSheet = [[LBActionSheetController alloc] initWithTitle:@"请选择"];
[actionSheet addActionTitle:@"拍照" style:LBActionSheetActionStyleDefault action:^(NSString * _Nonnull actionTitle) {
            
}];
[actionSheet addActionTitle:@"相册" style:LBActionSheetActionStyleCancel action:^(NSString * _Nonnull actionTitle) {
            
}];
[self presentViewController:actionSheet animated:YES completion:NULL];
```
