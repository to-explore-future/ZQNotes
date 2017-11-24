### ios tableView 莫名其妙的多了好多 separator
使用系统的样式 显示的好好的 

换成自定义的 cell 就突然多出了好多 出乎意外的 separator 

indexPath.section  正常  indexPath.row  正常

到底错误在哪里。。。

网上找找答案 找到了思路 

添加一个 tableFooterView 

好了 正常显示了 

源码没有开放 但是一定是 UITableView 哪里还不完善 