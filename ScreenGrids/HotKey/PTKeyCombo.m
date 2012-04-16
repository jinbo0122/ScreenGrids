//
//  PTKeyCombo.m
//  Protein
//
//  Created by Quentin Carnicelli on Sat Aug 02 2003.
//  Copyright (c) 2003 Quentin D. Carnicelli. All rights reserved.
//

#import "PTKeyCombo.h"
#import "PTKeyCodeTranslator.h"

@implementation PTKeyCombo
//static NSMutableDictionary *keyMap;
//static NSMutableDictionary *modMap;
+ (id)clearKeyCombo
{
	return [self keyComboWithKeyCode: -1 modifiers: -1];
}

+ (id)keyComboWithKeyCode: (NSInteger)keyCode modifiers: (NSUInteger)modifiers
{
	return [[self alloc] initWithKeyCode: keyCode modifiers: modifiers];
}
//+ (void)initialize {
//	
//	modMap = [[NSMutableDictionary alloc] init];
//	keyMap = [[NSMutableDictionary alloc] init];
//	
//	// Is this guaranteed to be the same across systems/keyboards?
//	// Probably not.
//	
//	//
//	// Keys
//	
//	mapKey(@"a",		0x00);
//	mapKey(@"b",		0x0B);
//	mapKey(@"c",		0x09);
//	mapKey(@"d",		0x02);
//	mapKey(@"e",		0x0E);
//	mapKey(@"f",		0x03);
//	mapKey(@"g",		0x05);
//	mapKey(@"h",		0x04);
//	mapKey(@"i",		0x22);
//	mapKey(@"j",		0x26);
//	mapKey(@"k",		0x29);
//	mapKey(@"l",		0x25);
//	mapKey(@"m",		0x2E);
//	mapKey(@"n",		0x2D);
//	mapKey(@"o",		0x1F);
//	mapKey(@"p",		0x23);
//	mapKey(@"q",		0x0C);
//	mapKey(@"r",		0x0F);
//	mapKey(@"s",		0x01);
//	mapKey(@"t",		0x11);
//	mapKey(@"u",		0x20);
//	mapKey(@"v",		0x09);
//	mapKey(@"w",		0x0D);
//	mapKey(@"x",		0x07);
//	mapKey(@"y",		0x10);
//	mapKey(@"z",		0x06);
//	
//	mapKey(@"0",		0x1D);
//	mapKey(@"1",		0x12);
//	mapKey(@"2",		0x13);
//	mapKey(@"3",		0x14);
//	mapKey(@"4",		0x15);
//	mapKey(@"5",		0x17);
//	mapKey(@"6",		0x16);
//	mapKey(@"7",		0x1A);
//	mapKey(@"8",		0x1C);
//	mapKey(@"9",		0x19);
//	
//	mapKey(@",",		0x2B);
//	mapKey(@".",		0x2F);
//	mapKey(@"/",		0x2C);
//	
//	mapKey(@"f1",		0x7A);
//	mapKey(@"f2",		0x79);
//	mapKey(@"f3",		0x63);
//	mapKey(@"f4",		0x76);
//	mapKey(@"f5",		0x60);
//	mapKey(@"f6",		0x61);
//	mapKey(@"f7",		0x62);
//	mapKey(@"f8",		0x64);
//	mapKey(@"f9",		0x65);
//	mapKey(@"f10",		0x6D);
//	mapKey(@"f11",		0x67);
//	mapKey(@"f12",		0x6F);
//	mapKey(@"f13",		0x69);
//	mapKey(@"f14",		0x6B);
//	mapKey(@"f15",		0x71);
//	
//	mapKey(@"escape",	0x35);
//	mapKey(@"esc",		0x35);
//	mapKey(@"space",	0x31);
//	mapKey(@"enter",	0x24);
//	mapKey(@"tab",		0x30);
//	mapKey(@"backspace",0x33);
//	mapKey(@"bkspc",	0x33);
//	
//	mapKey(@"left",		0x7B);
//	mapKey(@"right",	0x7C);
//	mapKey(@"down",		0x7D);
//	mapKey(@"up",		0x7E);
//	
//	//
//	// Modifiers
//	
//	mapMod(@"apple",	cmdKey);
//	
//	mapMod(@"ctrl",		controlKey);
//	mapMod(@"ctl",		controlKey);
//	mapMod(@"control",	controlKey);
//	
//	mapMod(@"opt",		optionKey);
//	mapMod(@"option",	optionKey);
//	mapMod(@"alt",		optionKey);
//	
//	mapMod(@"cmd",		cmdKey);
//	mapMod(@"command",	cmdKey);
//	mapMod(@"apple",	cmdKey);
//	
//	mapMod(@"shift",	shiftKey);
//	
//}
//
- (id)initWithKeyCode: (NSInteger)keyCode modifiers: (NSUInteger)modifiers
{
	self = [super init];

	if( self )
	{
		mKeyCode = keyCode;
		mModifiers = modifiers;
	}

	return self;
}

//- (id)initWithString:(NSString*)string{
//  NSUInteger keyRef		= 0;
//	NSUInteger modifiers	= 0;
//  
//  NSArray *bits = [[string lowercaseString] componentsSeparatedByString:@" "];
//	for (NSString *bit in bits) {
//    
//		NSNumber *code = [modMap objectForKey:bit];
//		if (code != nil) {
//			modifiers += [code unsignedLongValue];
//			continue;
//		}
//		
//		code = [keyMap objectForKey:bit];
//		if (code != nil) {
//			keyRef = [code unsignedLongValue];
//			continue;
//		}
//		
//	}
//  return [self initWithKeyCode:keyRef modifiers:modifiers];
//}

- (id)initWithPlistRepresentation: (id)plist
{
	int keyCode, modifiers;

	if( !plist || ![plist count] )
	{
		keyCode = -1;
		modifiers = -1;
	}
	else
	{
		keyCode = [[plist objectForKey: @"keyCode"] intValue];
		if( keyCode < 0 ) keyCode = -1;

		modifiers = [[plist objectForKey: @"modifiers"] intValue];
		if( modifiers <= 0 ) modifiers = -1;
	}

	return [self initWithKeyCode: keyCode modifiers: modifiers];
}

- (id)plistRepresentation
{
	return [NSDictionary dictionaryWithObjectsAndKeys:
				[NSNumber numberWithInteger: [self keyCode]], @"keyCode",
				[NSNumber numberWithInteger: [self modifiers]], @"modifiers",
				nil];
}

- (id)copyWithZone:(NSZone*)zone;
{
	return self;
}

- (BOOL)isEqual: (PTKeyCombo*)combo
{
	return	[self keyCode] == [combo keyCode] &&
			[self modifiers] == [combo modifiers];
}

#pragma mark -

- (NSInteger)keyCode
{
	return mKeyCode;
}

- (NSUInteger)modifiers
{
	return mModifiers;
}

- (BOOL)isValidHotKeyCombo
{
	return mKeyCode >= 0 && mModifiers > 0;
}

- (BOOL)isClearCombo
{
	return mKeyCode == -1 && mModifiers == -1;
}

@end

#pragma mark -

@implementation PTKeyCombo (UserDisplayAdditions)

+ (NSString*)_stringForModifiers: (long)modifiers
{
	static unichar modToChar[4][2] =
	{
		{ cmdKey, 		kCommandUnicode },
		{ optionKey,	kOptionUnicode },
		{ controlKey,	kControlUnicode },
		{ shiftKey,		kShiftUnicode }
	};

	NSString* str = [NSString string];
	long i;

	for( i = 0; i < 4; i++ )
	{
		if( modifiers & modToChar[i][0] )
			str = [str stringByAppendingString: [NSString stringWithCharacters: &modToChar[i][1] length: 1]];
	}

	return str;
}

+ (NSDictionary*)_keyCodesDictionary
{
	static NSDictionary* keyCodes = nil;

	if( keyCodes == nil )
	{
		NSURL *url = [NSURL fileURLWithPath:[[NSBundle bundleForClass: self] pathForResource: @"PTKeyCodes" ofType: @"plist"]];
		NSString *contents = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
		keyCodes = [contents propertyList];
	}

	return keyCodes;
}

+ (NSString*)_stringForKeyCode: (short)keyCode legacyKeyCodeMap: (NSDictionary*)dict
{
	id key;
	NSString* str;

	key = [NSString stringWithFormat: @"%d", keyCode];
	str = [dict objectForKey: key];

	if( !str )
		str = [NSString stringWithFormat: @"%X", keyCode];

	return str;
}

+ (NSString*)_stringForKeyCode: (short)keyCode newKeyCodeMap: (NSDictionary*)dict
{
	NSString* result;
	NSString* keyCodeStr;
	NSDictionary* unmappedKeys;
	NSArray* padKeys;

	keyCodeStr = [NSString stringWithFormat: @"%d", keyCode];

	//Handled if its not handled by translator
	unmappedKeys = [dict objectForKey:@"unmappedKeys"];
	result = [unmappedKeys objectForKey: keyCodeStr];
	if( result )
		return result;

	//Translate it
	result = [[[PTKeyCodeTranslator currentTranslator] translateKeyCode:keyCode] uppercaseString];

	//Handle if its a key-pad key
	padKeys = [dict objectForKey:@"padKeys"];
	if( [padKeys indexOfObject: keyCodeStr] != NSNotFound )
	{
		result = [NSString stringWithFormat:@"%@ %@", [dict objectForKey:@"padKeyString"], result];
	}

	return result;
}

+ (NSString*)_stringForKeyCode: (short)keyCode
{
	NSDictionary* dict;

	dict = [self _keyCodesDictionary];
	if( [[dict objectForKey: @"version"] intValue] <= 0 )
		return [self _stringForKeyCode: keyCode legacyKeyCodeMap: dict];

	return [self _stringForKeyCode: keyCode newKeyCodeMap: dict];
}

- (NSString*)keyCodeString
{
	// special case: the modifiers for the "clear" key are 0x0
	if ( [self isClearCombo] ) return @"";

    return [[self class] _stringForKeyCode:[self keyCode]];
}

- (NSUInteger)modifierMask
{
	// special case: the modifiers for the "clear" key are 0x0
	if ( [self isClearCombo] ) return 0;

	static NSUInteger modToChar[4][2] =
	{
		{ cmdKey, 		NSCommandKeyMask },
		{ optionKey,	NSAlternateKeyMask },
		{ controlKey,	NSControlKeyMask },
		{ shiftKey,		NSShiftKeyMask }
	};

    NSUInteger i, ret = 0;

    for ( i = 0; i < 4; i++ )
    {
        if ( [self modifiers] & modToChar[i][0] ) {
            ret |= modToChar[i][1];
        }
    }

    return ret;
}

- (NSString*)description
{
	NSString* desc;

	if( [self isValidHotKeyCombo] ) //This might have to change
	{
		desc = [NSString stringWithFormat: @"%@%@",
				[[self class] _stringForModifiers: [self modifiers]],
				[[self class] _stringForKeyCode: [self keyCode]]];
	}
	else
	{
		desc = NSLocalizedString( @"(None)", @"Hot Keys: Key Combo text for 'empty' combo" );
	}

	return desc;
}

@end
