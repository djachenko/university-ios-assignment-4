#import "NSValue+Serializable.h"

@implementation NSValue(Serializable)

- (NSString *)serializeWithError:(NSError **)error
{
	NSString *description = [self description];

	if ([description rangeOfString:@"NSRect"].location != NSNotFound)
	{
		CGRect rect = self.CGRectValue;

		return [NSString stringWithFormat:@"CGRect: [(%f, %f), (%f, %f)]", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height];
	}
	else
	{
		return nil;
	}
}

@end