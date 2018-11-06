## the handler class should be static or may leaks occur  

### leaks may occur
```
	private Handler handler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            if (msg.obj != null) {
                Log.i("obj", "obj:" + msg.obj.toString());
                lightState.changeState(msg.obj.toString());
            } else {
                invalidate();
            }
        }
    };

```  

#### 非静态内部类为什么持有外部类的this引用  


内部类虽然和外部类写在同一个文件中， 但是编译完成后， 还是生成各自的class文件，内部类通过this访问外部类的成员。  
1.编译器自动为内部类添加一个成员变量， 这个成员变量的类型和外部类的类型相同， 这个成员变量就是指向外部类对象(this)的引用；  
2.编译器自动为内部类的构造方法添加一个参数， 参数的类型是外部类的类型， 在构造方法内部使用这个参数为内部类中添加的成员变量赋值；  
3.在调用内部类的构造函数初始化内部类对象时，会默认传入外部类的引用。    
总结：一个类中含有一个内部类，并且在这个类中new了一个内部类的对象，这种情况形成了循环引用。这个类天生引用着这个内部类对象，而这个内部类对象在声明的时候，构造方法的参数默认带着外部类的实例。

### ?? 使用 环 的思想 还是无法理解 Android的内存泄露

