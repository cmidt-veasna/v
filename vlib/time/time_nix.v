// Copyright (c) 2019-2020 Alexander Medvednikov. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module time

struct C.tm {
	tm_year int
	tm_mon  int
	tm_mday int
	tm_hour int
	tm_min  int
	tm_sec  int
	tm_gmtoff int // seconds
}

pub fn convert_ctime(t tm) Time {
	return Time{
		year: t.tm_year + 1900
		month: t.tm_mon + 1
		day: t.tm_mday
		hour: t.tm_hour
		minute: t.tm_min
		second: t.tm_sec
		unix: make_unix_time(t)
	}
}

[inline]
fn make_unix_time(t tm) int {
	return C.mktime(&t) + t.tm_gmtoff
}
