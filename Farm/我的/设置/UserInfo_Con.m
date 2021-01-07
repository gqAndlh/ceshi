//
//  UserInfo_Con.m
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import "UserInfo_Con.h"
#import "EditName_Con.h"

@interface UserInfo_Con ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,strong) UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *acc;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *sex;

@end

@implementation UserInfo_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"会员资料";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)headClick:(UIButton *)sender {
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = YES;
    self.imagePicker.modalPresentationStyle = UIModalPresentationOverFullScreen;
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"从相机拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:self.imagePicker animated:YES completion:nil];
            });
            
        }
    }];
    
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:self.imagePicker animated:YES completion:nil];
        });
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消");
    }];
    
    [actionSheet addAction:cameraAction];
    [actionSheet addAction:photoAction];
    [actionSheet addAction:cancelAction];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
}
- (IBAction)nameClick:(UIButton *)sender {
    EditName_Con *edit=[[EditName_Con alloc]init];
    [self.navigationController pushViewController:edit animated:YES];
}
- (IBAction)sexClick:(UIButton *)sender {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *bm = [UIAlertAction actionWithTitle:@"保密" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _sex.text=@"保密";
    }];
    
    UIAlertAction *nan = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _sex.text=@"男";
        
    }];
    UIAlertAction *nv = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _sex.text=@"女";
        
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [actionSheet addAction:bm];
    [actionSheet addAction:nan];
    [actionSheet addAction:nv];
    [actionSheet addAction:cancelAction];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
}


//获取选择的图片
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSData *data=UIImageJPEGRepresentation(image, 0.5);
//    [HomeManager upHeadImg:data Success:^(NSDictionary * _Nonnull dic) {
//        if ([dic[@"code"] intValue]==0) {
//            _headImgstr=dic[@"data"][@"url"];
//        }
//    } failure:^(NSString * _Nonnull error) {
//        DLog(@"上传头像---%@",error);
//    }];
    [_headImg setImage:image];
}
//从相机或者相册界面弹出
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
