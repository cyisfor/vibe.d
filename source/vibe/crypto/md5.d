/**
	MD5 hashing functions.

	Copyright: © 2012 RejectedSoftware e.K.
	License: Subject to the terms of the MIT license, as written in the included LICENSE.txt file.
	Authors: Jan Krüger
*/
module vibe.crypto.md5;

import std.compiler;

static if(D_major > 2 || D_major == 2 && D_minor >= 61){
	import std.digest.md;

	string md5(in char[] str) 
	{
		MD5 ctx;
		ctx.start();
		ctx.put(str);
		return ctx.finish().toHexString();
	}
} else {
	import std.md5;

	string md5(in char[] str) 
	{
		ubyte[16] digest;
		MD5_CTX ctx;
		ctx.start();
		ctx.update(str);
		ctx.finish(digest);
		return digestToString(digest);
	}
}