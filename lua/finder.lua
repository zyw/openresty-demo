local ffi = require("ffi")
local C = ffi.C

ffi.cdef[[
	int Java_com_fgtit_fpcore_MatchTemplate(char[] *src, char[] *dst);
	int printf(const char *fmt, ...);
]]

local src = "AwFdIAAAAAYAAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAAAAAAI"..
"BkmeOIfG/hEJR/5KDR0+WxEgvkGXHZ5NmaEeGJ0cvlweJR5aKqoeZS1o/jc0gv5wudSebw3hn14Y"..
"Yr9EnitfaJ5lXzoggp9BpUF/WTxAP2rAKn9iBV+URkIaXEIPXX09E0Q1Qr6C3Wil5zpqqBMaTLkZ"..
"OE84QJlUBAiWUAZcFwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"..
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMBVh8AAIACgAAAAAAAAAAAAAAAAAAAAAAAAAAA"..
"AIAAgACAAMAAwAAAAAAAAAAAAAAAAAAAAAAAN4RHXkMLRz4cjAg+VBEdnmSVIP4jIF0+ZKJlPg4l"..
"3B5jrym+QjjC/neRob9nHKK/cSKlf0Okgv9LKYGfY0Ds301DA59riV98TBNdvUaXBL1Uh0faWAqe"..
"Olw8LPpXPVk6Sxsd+HGqZvh0LFL4cq7nGF6IHflkCJ85TiJrOQAAAAAAAAAAAAAAAAAAAAAAAAAA"..
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="

local target = "AwFZIQAAAAYAAgACAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgADAAEgQAAAAAAAAAAAAAAAAAABe"..
"iOSeFoxc/jeQA15pEGb+VhurnmKf6b4zpQN+ba1VHgivg/5BDOyfWg/mXz4UQl9VLsDfPzCC/2az"..
"az8JORq3IzvaXyZABB9Vw0L/WruA3Gi8Frxmw4A8Y5eo3WcbFHpRIltSVj5Zumg/7NpMoIKzQjYD"..
"G00pAThDNBq4SyoZmUEGXRIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"..
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMBWCEAAIAGAAIAAAAAAAAAAAAAAAAAAAAAAAAA"..
"AAAAAACAAIAAwAAAAAAAAAAAAAAAAAAAAAAARIWHPikMiD5QDIc+YJHdflaUXf5xlyD+EZqdnnIk"..
"ZL4Yplv+D6obXm4xat5KukP+G8IEXhoGyp8OjMqfc53jXzChHV9OpcM/VasCH3CIH5xTGETdYISH"..
"mhcySJJijJ6bWiPrexk03JNXnJ34ZD7AmGqJHdlhv5l5YAgItmSInVdfHaCSAAAAAAAAAAAAAAAA"..
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="

local lib = ffi.load("/vagrant/openresty-demo/libs/libfpcorejni.so")

local num = lib.Java_com_fgtit_fpcore_MatchTemplate(src,target)

C.printf("Hello %s!", "world")

ngx.say("------------------------")