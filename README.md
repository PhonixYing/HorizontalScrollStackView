# HorizontalScrollStackView

UIStackView是iOS9推出的一个非常好用的控件，如果能结合UIScrollView做成能横竖滚动的效果就更好了。
如果让UIStackView滚动起来，那就更好了，这个demo是用Masonry代码写的布局。

UIStackView is a very useful control introduced by iOS9. It can be better if it can be combined with UIScrollView to scroll horizontally and vertically.
If you let the UIStackView scroll, it's even better. This demo is a layout written in Masonry code.


发现最关键的设置UIStackView的约束，找到的核心代码如下：
<br>`[stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_horizontalScrollView);
        make.bottom.equalTo(_horizontalScrollView);
        make.leading.equalTo(_horizontalScrollView);
        make.trailing.equalTo(_horizontalScrollView);
        make.height.equalTo(_horizontalScrollView);
        make.width.mas_equalTo(ScreenWidth * 2);
    }];`

#### 注意点:
#### 注意这里设置的约束，最后一个宽度的约束很关键
#### 这里是横向滚动，一定要设置横向的宽度大于滚动区域的宽度

![HorizontalScrollStackView.gif](https://upload-images.jianshu.io/upload_images/3066008-76ab8d457d3566fc.gif?imageMogr2/auto-orient/strip)
