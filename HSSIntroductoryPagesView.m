//
//  HSSIntroductoryPagesView.m
//  HSSIntroductoryPagesManager
//
//  Created by 和系 on 2018/4/25.
//

#import "HSSIntroductoryPagesView.h"

@interface HSSIntroductoryPagesView ()<UIScrollViewDelegate>
@property (nonatomic, strong) NSArray<NSString *> *imagesArray;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (weak, nonatomic) UIScrollView *scrollView;
@end
@implementation HSSIntroductoryPagesView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUI];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
+ (instancetype)pagesViewWithFrame:(CGRect)frame images:(NSArray<NSString *> *)images{
    
    HSSIntroductoryPagesView * pagesView = [[self alloc] initWithFrame:frame];
    pagesView.imagesArray = images;
    return pagesView;
}
- (void)setUI{
    self.backgroundColor = [UIColor clearColor];
    UITapGestureRecognizer *singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTapFrom)];
    singleRecognizer.numberOfTapsRequired = 1;
    [self.scrollView addGestureRecognizer:singleRecognizer];
}
- (void)setImagesArray:(NSArray<NSString *> *)imagesArray{
    _imagesArray = imagesArray;
    [self loadPageView];
}

- (void)loadPageView{
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.scrollView.contentSize = CGSizeMake((self.imagesArray.count+1) * kScreenWidth, kScreenHeight);
    self.pageControl.numberOfPages = self.imagesArray.count;
    for (NSInteger i = 0; i < self.imagesArray.count; i ++) {
        NSString * imageName = self.imagesArray[i];
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth*i, 0, kScreenWidth, kScreenHeight)];
        imageView.image = [UIImage imageNamed:imageName];
        [self.scrollView addSubview:imageView];
    }
}
- (void)handleSingleTapFrom{
    if (self.pageControl.currentPage == self.imagesArray.count - 1) {
        [self removeFromSuperview];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offSet = scrollView.contentOffset;
    NSInteger page = (offSet.x / (self.bounds.size.width) + 0.5);
    self.pageControl.currentPage = page;//计算当前的页码
    self.pageControl.hidden = (page > self.imagesArray.count - 1);
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x >= (_imagesArray.count) * kScreenWidth) {
        [self removeFromSuperview];
    }
}





- (UIScrollView *)scrollView{
    if (!_scrollView) {
        UIScrollView * sc = [[UIScrollView alloc]initWithFrame:self.bounds];
        [self addSubview:sc];
        sc.bounces = NO;
        sc.showsVerticalScrollIndicator = sc.showsHorizontalScrollIndicator = NO;
        sc.backgroundColor = [UIColor clearColor];
        sc.pagingEnabled = YES;
        sc.delegate = self;
        _scrollView = sc;
    }
    return _scrollView;
}
- (UIPageControl *)pageControl
{
    if(!_pageControl)
    {
        UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(kScreenWidth/2, kScreenHeight - 60, 0, 40)];
        pageControl.backgroundColor = [UIColor clearColor];
        pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        [self addSubview:pageControl];
        _pageControl = pageControl;
    }
    return _pageControl;
}












@end
