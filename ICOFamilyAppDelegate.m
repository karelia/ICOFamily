// Copyright (c) 2011 Alex Zielenski
// All Rights Reserved
//
// Permission is hereby granted, free of charge, to any person obtaining 
// a copy of this software and associated documentation files (the 
// "Software"), to deal in the Software without restriction, including 
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense,  and/or sell copies of the Software, and to 
// permit persons to whom the Software is furnished to do so, subject to 
// the following conditions:
//
// The above copyright notice and this permission notice shall be 
// included in all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "ICOFamilyAppDelegate.h"
#import "ICOFamily.h"

@implementation ICOFamilyAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
		
	NSImage *test16 = [NSImage imageNamed:@"globe16"];
	NSImage *test32 = [NSImage imageNamed:@"globe32"];

	NSBitmapImageRep *bitmap16	= [[test16 representations] lastObject];
	NSBitmapImageRep *bitmap32	= [[test32 representations] lastObject];

	[[bitmap16 TIFFRepresentation] writeToFile:[@"~/Desktop/ICOFamilyTestIcon.16.tiff" stringByExpandingTildeInPath] atomically:NO];
	[[bitmap32 TIFFRepresentation] writeToFile:[@"~/Desktop/ICOFamilyTestIcon.32.tiff" stringByExpandingTildeInPath] atomically:NO];

	ICOFamily *fam = [ICOFamily family]; // Returns an autoreleased instance

	[fam setBitmapImageRep:bitmap16 forElement:kICOFamily16Element];
	[fam setBitmapImageRep:bitmap32 forElement:kICOFamily32Element];

	[fam.data writeToFile:[@"~/Desktop/ICOFamilyTestIcon.ico" stringByExpandingTildeInPath] atomically:NO];
}

@end
