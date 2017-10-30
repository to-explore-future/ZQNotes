#### ios 改变`UIImageView`的分辨率


```
- ( UIImage )imageWithImageSimple:( UIImage )image scaledToSize:( CGSize )newSize{

    UIGraphicsBeginImageContext (newSize);

    [image drawInRect : CGRectMake ( 0 , 0 ,newSize. width ,newSize. height )];

    UIImage  newImage = UIGraphicsGetImageFromCurrentImageContext ();

    UIGraphicsEndImageContext ();

    return newImage;
}

```