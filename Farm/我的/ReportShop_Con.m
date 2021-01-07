//
//  ReportShop_Con.m
//  Farm
//
//  Created by mac on 2020/12/29.
//

#import "ReportShop_Con.h"
#import "ReportAlert_Con.h"

@interface ReportShop_Con ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,strong) UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet UIScrollView *backView;

@property (weak, nonatomic) IBOutlet UIView *picView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *one;
@property (weak, nonatomic) IBOutlet UILabel *two;
@property (weak, nonatomic) IBOutlet UILabel *three;
@property (weak, nonatomic) IBOutlet UIView *downView;
@property (weak, nonatomic) IBOutlet UIButton *qualityBtn;//质量
@property (weak, nonatomic) IBOutlet UIButton *sellBtn;//出售
@property(nonatomic)NSMutableArray *picArr;
@property(nonatomic)int state;//状态

@end

@implementation ReportShop_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"商品记录";
    _state=0;
    _picArr=[NSMutableArray array];
    _one.layer.borderWidth=1;
    _one.layer.borderColor=[UIColor redColor].CGColor;
    _two.layer.borderWidth=1;
    _two.layer.borderColor=[UIColor grayColor].CGColor;
    _three.layer.borderWidth=1;
    _three.layer.borderColor=[UIColor grayColor].CGColor;

    [self showPics];
    
    
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - 图片显示
-(void)showPics{
    for (UIView *v in _picView.subviews) {
        [v removeFromSuperview];
    }
    NSInteger a = (_picArr.count<5)?_picArr.count+1:_picArr.count;
    int w = (SCREEN_WIDTH-30)/3;
    for (int i = 0; i<a; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake((i%3)*(w+5), (i/3)*w, w-20, w-20);
//        btn.backgroundColor=[UIColor greenColor];
        [_picView addSubview:btn];
        if (i==_picArr.count) {
            [btn setBackgroundImage:[UIImage imageNamed:@"addPic"] forState:0];
            [btn addTarget:self action:@selector(addPic) forControlEvents:UIControlEventTouchUpInside];
        }else{
            [btn setBackgroundImage:_picArr[i] forState:0];
        }
        
        if (i<_picArr.count) {
            UIButton *close=[UIButton buttonWithType:UIButtonTypeCustom];
            [close setImage:[UIImage imageNamed:@"delPic"] forState:0];
            close.frame=CGRectMake(CGRectGetMaxX(btn.frame)-8, (i/3)*w-8, 16, 16);
            close.tag=i;
            [close addTarget:self action:@selector(delClick:) forControlEvents:UIControlEventTouchUpInside];
            [_picView addSubview:close];
        }
    }
    CGRect PF = _picView.frame;
    if (a%3==0) {
        PF.size.height=(a/3)*w;
    }else{
        PF.size.height=(a/3+1)*w;
    }
    _picView.frame=PF;
    
    CGRect DF = _downView.frame;
    DF.size.height = CGRectGetMaxY(_picView.frame)+80;
    _downView.frame=DF;
    _backView.contentSize=CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(_downView.frame));
}
-(void)delClick:(UIButton *)btn{
    [_picArr removeObjectAtIndex:btn.tag];
    [self showPics];
}
-(void)addPic{
    DLog(@"添加图片");
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = NO;
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
#pragma mark - 举报须知
- (IBAction)noteClick:(UIButton *)sender {
    [self.navigationController pushViewController:[ReportAlert_Con new] animated:YES];
}
- (IBAction)typeClick:(UIButton *)sender {
    if (sender.tag==0) {
        _qualityBtn.selected=YES;
        _sellBtn.selected=NO;
    }else{
        _qualityBtn.selected=NO;
        _sellBtn.selected=YES;
    }
}
- (IBAction)sureClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
    [_picArr addObject:image];
    [self showPics];
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
