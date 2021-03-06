#import "NSSet+Serializable.h"
#import "Serializer.h"


@implementation NSSet (Serializable)

- (NSString *)serializeWithError:(NSError **)error
{
	NSMutableString *result = [[NSMutableString alloc] initWithFormat:@"set: ("];

	for (id<Serializable> element in self)
	{
		NSString *serializedElement = [Serializer serialize:element withError:error];

		if (serializedElement != nil)
		{
			[result appendFormat:@"%@,", serializedElement];
		}
		else
		{
			return nil;
		}
	}

	if (self.count != 0)
	{
		[result replaceCharactersInRange:NSMakeRange([result length] - 1, 1) withString:@""];
	}

	[result appendString:@")\n"];

	return result;
}

@end