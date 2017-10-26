//
//  ViewController.h
//  TabView
//
//  Created by to-explore-future on 17/10/26.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    UITableView * _tableView;
    NSMutableArray * _data;
    //
    UIBarButtonItem * _edit;
    UIBarButtonItem * _delete;
    UIBarButtonItem * _done;
 
    
}


@end

