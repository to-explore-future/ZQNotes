#### NSCFArray removeObjectAtIndex:]: mutating method sent to immutable object

找遍了了所有的地方，使用的都是 NSmutableArray 很郁闷 怎么就爆了这个错 

原因：虽说 NSMutableArray 是可变的数组，但是如果生命之后，是直接赋值，他就会变成不可变数组

你没有调用 addObject 方法  

我怎么解决

```
NSMutableArray * arr = model.countries;//直接赋值的 无法修改了
NSMutableArray * newArr = [NSMutableArray arrayWithArray:arr];//变成一个新的可以修改的
[newArr replaceObjectAtIndex:self.indexPath.row withObject:temp];//在新的里面修改
model.countries = nil;	
model.countries = newArr;	//把原来的指针 指向新的可变的数组

```