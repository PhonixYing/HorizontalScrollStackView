//
//  ViewController.m
//  HorizontalScrollStackView
//
//  Created by dong hui li on 2018/9/5.
//  Copyright © 2018年 dong hui li. All rights reserved.
//

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define RandomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()<UIScrollViewDelegate>

// 可以横向滚动的滚动视图
@property (nonatomic, strong) UIScrollView *horizontalScrollView;

// 放在滚动视图上，可以滚动的UIStackView
@property (nonatomic, strong) UIStackView *swipStackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initComponent];
}

/**
 构建视图
 */
-(void)initComponent
{
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // 横向滚动视图
    _horizontalScrollView = [[UIScrollView alloc] init];
    [self.view addSubview:_horizontalScrollView];
    [_horizontalScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.width.mas_equalTo(ScreenWidth);
        make.height.mas_equalTo(90);
    }];
    _horizontalScrollView.backgroundColor = [UIColor whiteColor];
    _horizontalScrollView.contentSize = CGSizeMake(ScreenWidth * 2, 90);
    _horizontalScrollView.showsVerticalScrollIndicator = NO;
    _horizontalScrollView.showsHorizontalScrollIndicator = NO;
    _horizontalScrollView.delegate = self;
    
    // 横向的UIStackView
    _swipStackView = [[UIStackView alloc] init];
    [_horizontalScrollView addSubview:_swipStackView];
    // 设置为排列
    _swipStackView.axis = UILayoutConstraintAxisHorizontal;
    // 子视图填充空白区域并等分
    _swipStackView.distribution = UIStackViewDistributionFillEqually;
    // 注意这里设置的约束，最后一个宽度的约束很关键
    [_swipStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_horizontalScrollView);
        make.bottom.equalTo(_horizontalScrollView);
        make.leading.equalTo(_horizontalScrollView);
        make.trailing.equalTo(_horizontalScrollView);
        make.height.equalTo(_horizontalScrollView);
        make.width.mas_equalTo(ScreenWidth * 2);
    }];
    // 添加子视图(UIButton)
    for (int i = 0;i < 10;i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_swipStackView addArrangedSubview:button];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        button.backgroundColor = RandomColor;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
