常用类:JLRouterManager (author:lsh email:lshmissjhy@gmail.com)
    JLRouterManager 一个基于JLRouter （第三方路由跳转类） 的管理类。
    目前主要作用就是解耦控制器之间跳转，比如：A和B是两个VC， 在A里面跳到B 那么之前做法是在A里面引入B ，然后在初始化B，最后跳转。
这样没问题，但是随着项目规模扩大，A里面可能还要引入其他类，这样A和其他类耦合性越来越高。不利于后期迁移和维护。
    JLRouterManager 就解决了不需要引入B控制器，就可以直接跳转的问题
    主要用法：JLRouterManager 里面包含了一个RouterModel，这个model 用来封装跳转的参数。因为JLRouter 设计思路就是根据scheme
转写出来的，所以RouterModel 也就是封装了scheme 和className，pathUrl，scheme 是用来存粗scheme，className 是一个数组，理论上可以放入很多个跳转VC的名字，其实在app内部跳转仅仅需要放一个VC参数就可以。pathUrl是拼接scheme和后面的className参数形成的一个url。参数格式也是根据JLRouter内部源码解析来定的，废话不多说。举个使用的例子

注册逻辑
    RouterModel *model = [[RouterModel alloc] initWithScheme:@"你的scheme" className:@[@"vcName"] identify:RouterParamsKey];
    [[JLRouterManager routerManagerWithKeyModel:model] registerJLRouterWithParams:YES completion:nil destionVC:nil];
    你的scheme 就是项目里info.plist URL Types 的URL Scheme 
    ClassName 就是要存放参数的数组，对于注册来说 ViewController 就是你控制器的名字，也可以随便写。
    identify 是区分keyModel 还是ValueModel ,两种解析形式不同，没写成2个model，

    YES 是指是否传参数，Yes传，反之NO
    completion 这个block 是在模态视图推的，导航视图直接nil就行
    destionVC 这个block提供一个即将推出来的VC对象，你可以获取这个VC，基本用不着，因为已经有传参了。
    
这个是跳转逻辑:
    RouterModel *model = [[RouterModel alloc] initWithScheme:@“你的scheme” className:@[@"testViewController?key=value&pushMethod=Present"] identify:RouterParamsValue];
    [[JLRouterManager routerManager] openWithValueModel:model];
    

    @“你的scheme” 还是Scheme名称 JumpVC?key=value 这是url基础知识，（不明白的自省google）jumpVC是你的控制器的名称，不能写错，你项目里面的控制器名称必须要和这个一样，否则找不到控制器就跳不了。？后面的就是参数的key 和value值，如果不需要参数可以不写！
     我们app内跳转常用的基本就是导航栏推，如果你要用模态视图就必须加 pushMethod=Present 这个键值对，不能错一个单词。具体可以在类里面看 pushMethod=push 就是导航栏推

    特别提醒 注册逻辑和跳转逻辑的参数个数必须一样，JLRouter里面根据个数判断，如果不一样多，不能跳转
看完JLRouter内部源码之后才会发现 它把你注册的参数作为key 跳转的参数作为Value！ @{@"ViewController" : @"JumpVC",@"key":@"value",....} ...号代表还有其他参数，具体自己打断点去看。我们主要就是为了拿到@{@"ViewController" : @"JumpVC",@"key":@"value"} 这两个健值对！
如果想传参数我的写法就是在基类控制器里面新增初始化方法，- (instancetype)initWithParams:(NSDictinoary)dic 参数就是我们拿到的JLRouter 的参数。
   

    

     
