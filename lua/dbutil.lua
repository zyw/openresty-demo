local mysql = require "resty.mysql"

local dbutil = {}

function dbutil.instantiateMysql()
  local db,err = mysql:new()
  if not db then
    ngx.say("实例化MySql错误：",err)
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

  return db

end

function dbutil.resultSet(db,sql)
  local res, err, errno, sqlstate = db:query(sql,10)

  if not res then
  	ngx.say("bad result: ", err, ": ", errno, ": ", sqlstate, ".")
  	return
  end
  return res
end

return dbutil
