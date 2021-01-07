//
//  Feedback_Con.m
//  Farm
//
//  Created by mac on 2020/12/18.
//

#import "Feedback_Con.h"
#import "QuestionType_View.h"

@interface Feedback_Con ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *typeBtn;
@property (weak, nonatomic) IBOutlet UITextView *FkText;
@property (weak, nonatomic) IBOutlet UITextField *phone;

@end

@implementation Feedback_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"意见反馈";
    _FkText.delegate=self;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)submitClick:(UIButton *)sender {
    if ([_FkText.text isEqualToString:@"请填写反馈内容"]) {
        [PubLic_Class addMBProgressViewTitle:@"请填写反馈内容" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }else if (_phone.text.length==0){
        [PubLic_Class addMBProgressViewTitle:@"请填写手机/QQ/微信号" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)typeClick:(UIButton *)sender {
    QuestionType_View *question=[[[NSBundle mainBundle]loadNibNamed:@"QuestionType_View" owner:nil options:nil]lastObject];
    question.frame=[UIApplication sharedApplication].keyWindow.bounds;
    question.type=0;
    [question creatView];
    question.QuestionBlock = ^(NSString * _Nonnull showText) {
        [_typeBtn setTitle:[NSString stringWithFormat:@"%@ >",showText] forState:0];
    };
    [[UIApplication sharedApplication].keyWindow addSubview:question];
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    if ([_FkText.text isEqualToString:@"请填写反馈内容"]) {
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
