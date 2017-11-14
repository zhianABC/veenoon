//
//  User.m
//  hkeeping
//
//  Created by jack on 3/3/14.
//  Copyright (c) 2015 G-Wearable Inc. All rights reserved..
//

#import "User.h"

@implementation User
@synthesize _userId;
///Token
@synthesize _authtoken;

///名字
@synthesize _userName;

///邮箱
@synthesize _email;


@synthesize _avatar;
@synthesize _source;

@synthesize _cellphone;
@synthesize _qr;

@synthesize _ctime;

@synthesize address;
@synthesize companyname;
@synthesize ranktitle;
@synthesize telephone;

- (id) initWithDicionary:(NSDictionary*)dic{
    
    self = [super init];
    
    self._authtoken = [dic objectForKey:@"key"];
    self._userId = [NSString stringWithFormat:@"%d", [[dic objectForKey:@"id"] intValue]];
    [self updateUserInfo:dic];
    
    return self;
}

- (void) updateUserInfo:(NSDictionary*)dic{
    
    NSString *value = [dic objectForKey:@"fullname"];
    if([value isKindOfClass:[NSNull class]])
    {
        value = @"";
    }
    self._userName = value;
    
    
    value = [dic objectForKey:@"avatarurl"];
    if([value isKindOfClass:[NSNull class]])
    {
        value = @"";
    }
    self._avatar = value;
    
    
    
    value = [dic objectForKey:@"appuid"];
    if([value isKindOfClass:[NSNull class]])
    {
        value = @"";
    }
    self._qr = value;
    
    value = [dic objectForKey:@"cellphone"];
    if([value isKindOfClass:[NSNull class]])
    {
        value = @"";
    }
    self._cellphone = value;
    
    value = [dic objectForKey:@"email"];
    if([value isKindOfClass:[NSNull class]])
    {
        value = @"";
    }
    self._email = value;
    
    value = [dic objectForKey:@"company"];
    if([value isKindOfClass:[NSNull class]])
    {
        value = @"";
    }
    self.companyname = value;
    
    value = [dic objectForKey:@"title"];
    if([value isKindOfClass:[NSNull class]])
    {
        value = @"";
    }
    self.ranktitle = value;
    
    value = [dic objectForKey:@"address"];
    if([value isKindOfClass:[NSNull class]])
    {
        value = @"";
    }
    self.address = value;
    
    value = [dic objectForKey:@"telephone"];
    if([value isKindOfClass:[NSNull class]])
    {
        value = @"";
    }
    self.telephone = value;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self._userId = [aDecoder decodeObjectForKey:@"userid"];
        self._authtoken = [aDecoder decodeObjectForKey:@"token"];
        
        self._userName = [aDecoder decodeObjectForKey:@"userName"];
        
        //self._account = [aDecoder decodeObjectForKey:@"_account"];
        
        self._avatar = [aDecoder decodeObjectForKey:@"avatarurl"];
        self._email = [aDecoder decodeObjectForKey:@"email"];
        
        self._source = [aDecoder decodeObjectForKey:@"source"];
        
        self._cellphone = [aDecoder decodeObjectForKey:@"cellphone"];
        
        self._qr = [aDecoder decodeObjectForKey:@"appuid"];
        
        
        self.companyname = [aDecoder decodeObjectForKey:@"companyname"];
        self.ranktitle = [aDecoder decodeObjectForKey:@"ranktitle"];
        self.telephone = [aDecoder decodeObjectForKey:@"telephone"];
        self.address = [aDecoder decodeObjectForKey:@"address"];
        
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self._userId forKey:@"userid"];
    [aCoder encodeObject:self._authtoken forKey:@"token"];
    
    
    [aCoder encodeObject:self._userName forKey:@"userName"];
    
    
    [aCoder encodeObject:self._avatar forKey:@"avatarurl"];
    [aCoder encodeObject:self._email forKey:@"email"];
    
    [aCoder encodeObject:self._source forKey:@"source"];
    
    [aCoder encodeObject:self._cellphone forKey:@"cellphone"];
    
    
    [aCoder encodeObject:self._qr forKey:@"appuid"];
    
    [aCoder encodeObject:self.companyname forKey:@"companyname"];
    [aCoder encodeObject:self.ranktitle forKey:@"ranktitle"];
    [aCoder encodeObject:self.telephone forKey:@"telephone"];
    [aCoder encodeObject:self.address forKey:@"address"];
    
}

@end
