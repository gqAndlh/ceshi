//
//  AddAdvisory_Con.m
//  Farm
//
//  Created by mac on 2020/12/22.
//

#import "AddAdvisory_Con.h"
#import "QuestionType_View.h"

@interface AddAdvisory_Con ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *typeBtn;
@property (weak, nonatomic) IBOutlet UITextView *FkText;



@end

@implementation AddAdvisory_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"发表咨询";
    _FkText.delegate=self;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)submitClick:(UIButton *)sender {
    if ([_FkText.text isEqualToString:@"请填写咨询内容"]) {
        [PubLic_Class addMBProgressViewTitle:@"请填写咨询内容" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)typeClick:(UIButton *)sender {
    QuestionType_View *question=[[[NSBundle mainBundle]loadNibNamed:@"QuestionType_View" owner:nil options:nil]lastObject];
    question.frame=[UIApplication sharedApplication].keyWindow.bounds;
    question.type=3;
    [question creatView];
    question.QuestionBlock = ^(NSString * _Nonnull showText) {
        [_typeBtn setTitle:[NSString stringWithFormat:@"%@ >",showText] forState:0];
    };
    [[UIApplication sharedApplication].keyWindow addSubview:question];
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    if ([_FkText.text isEqualToString:@"请填写咨询内容"]) {
        _FkText.text=@"";
    }
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
