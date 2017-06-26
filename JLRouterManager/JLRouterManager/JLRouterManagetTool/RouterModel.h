//
//  RouterModel.h
//  UsualTest
//
//  Created by fns on 2017/6/21.
//  Copyright © 2017年 fns. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
    1. 区分是拼接key 还是value
    2. 如果是key ，注册的参数地址组成 scheme 是usualTest   后面的key就是/:params1/:params2 ....... 你可以在参数数组里面这样写@[@"params1",@"params2"]
    3. 如果是value 传入的参数地址是  @"usualTest:/BVC/bbb/ccc"  那么scheme 就是usual  参数就是后面的/BVC/bbb/ccc"
     你可以在参数数组里面这样写@[@"BVC",@"bbb",@"ccc",]
 */
typedef NS_ENUM(NSInteger, KeyAndValue) {
    RouterParamsKey,//拼接参数为key
    RouterParamsValue//拼接参数为Value
};



typedef NS_ENUM(NSInteger, PushMethod) {
    Push,//导航栏推
    Present//模态视图推
};



/**
    RouterModel 的属性就是JLRouter 内部定义的参数Key值，RouterModel 内部接受到Key值之后会根据JLRouter格式自行封装
    注意！如果是封装参数目前仅支持app内部封装格式，服务器端不管。 app内部封装格式就是 scheme:/params1:/params2:/params3 ....
 */

@interface RouterModel : NSObject

//注册时候初始化方法
- (instancetype)initWithScheme:(NSString *)scheme className:(NSArray *)className identify:(KeyAndValue)identify;

@property (nonatomic, copy) NSString *scheme;

/**
 ClassName就是你要跳转到app内部具体的类名称集合！
 */
@property (nonatomic, copy) NSArray<NSString *> *className;
/**
 拼接处理过后的传给JLRouter的参数字符串！
 */

@property (nonatomic, copy) NSString *pathUrl;



@property (nonatomic, assign,readonly) KeyAndValue identify;//是key 还是value,为了判断错误添加的

@end
