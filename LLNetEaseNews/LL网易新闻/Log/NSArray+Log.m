

#import "NSArray+Log.h"

@implementation NSArray (Log)



- (NSString *)descriptionWithLocale:(id)locale
{

    NSMutableString *stringM = [NSMutableString string];

    [stringM appendString:@"(\n"];

    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [stringM appendFormat:@"\t%@,\n",obj];
    }];

    [stringM appendString:@")\n"];
    
    return stringM;
}

@end

@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    
    NSMutableString *stringM = [NSMutableString string];
    
    [stringM appendString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [stringM appendFormat:@"\t%@ = %@;\n",key,obj];
    }];
    
    [stringM appendString:@"}\n"];
    
    return stringM;
}

@end
