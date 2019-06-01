//
//  JGDrawController.m
//  JGDrawing_Demo
//
//  Created by 郭军 on 2019/6/1.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGDrawController.h"
#import "JGView.h"

@interface JGDrawController ()

@end

@implementation JGDrawController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    JGView *View = [[JGView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    [self.view addSubview:View];
    
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
