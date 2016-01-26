local mysql = require "resty.mysql"
local db,err = mysql:new()
if not db then
	ngx.say("failed to instantiate mysql: ",err)
	return
end

db:set_timeout(1000) -- 1 sec

local ok,err,errno,sqlstate = db:connect{
	host = "127.0.0.1",
	port = 3306,
	database = "pre_release",
	user = "root",
	password = "000000",
	max_packet_size = 1024 * 1024
}

if not ok then
	ngx.say("failed to connect: ", err, ": ", errno, " ", sqlstate)
	return
end

ngx.say("connected to mysql.")

local res, err, errno, sqlstate = db:query("select * from s_voucher_seq",10)

if not res then
	ngx.say("bad result: ", err, ": ", errno, ": ", sqlstate, ".")
	return
end

local cjson = require "cjson"
ngx.say(cjson.encode(res))

local ok,err = db:set_keepalive(10000,100)

if not ok then
	ngx.say("failed to set keepalive: ", err)
	return
end