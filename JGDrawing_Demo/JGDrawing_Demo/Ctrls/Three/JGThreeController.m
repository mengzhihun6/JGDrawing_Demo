//
//  JGThreeController.m
//  JGDrawing_Demo
//
//  Created by 郭军 on 2019/6/1.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGThreeController.h"
#import "JGCGContextRefView.h"

@interface JGThreeController ()

@end

@implementation JGThreeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    JGCGContextRefView *refView = [[JGCGContextRefView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:refView];
    
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
