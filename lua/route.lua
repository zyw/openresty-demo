-- require "LuaXml"

-- local xmlData = ngx.req.get_post_args()

-- local xmlStr = xmlData.xmlContent
-- -- ngx.say(type(xmlStr))
-- local xfile = xml.eval(xmlStr)
-- -- local transactionCode = xfile:find("Version")
-- if xfile ~= nil then
-- 	for i,v in ipairs(xfile) do
-- 		-- local dd = v:find("h2")
-- 		-- if dd ~= nil then
-- 		-- 	ngx.say(dd[1])
-- 		-- end
-- 		local length = table.getn(v)
-- 		if length > 1 then
-- 			for j,a in ipairs(v) do 

-- 				ngx.say(a[1],"---",table.getn(a))
-- 			end
-- 		end
-- 		-- if v ~= nil then
-- 		-- 	ngx.say(v[1])
-- 		-- end
-- 	end
-- else
-- 	ngx.say("-----------------")
-- end

local xml = require 'xml'
local tooltip = require "tooltip"
local xmlData = ngx.req.get_post_args()

local xmlStr = xmlData.xmlContent

local data = xml.load(xmlStr)

-- ngx.say(table.getn(data))
-- local head = xml.find(data,"Head")
-- local version = xml.find(head,"Version")
-- ngx.say(version.xml,'----',version[1])
-- function parserXml(data,result)
-- 	if table.getn(data) > 1 then
-- 		for i,v in ipairs(data) do
-- 			parserXml(v,result)
-- 		end
-- 	else
-- 		result[data.xml] = data[1]
-- 	end
-- 	return result
-- end

local o = tooltip.ParserXml(data,{})
local uri = "/"..o["TransactionCode"]
local result = ngx.location.capture(uri,{ args= o })
ngx.say(result.body)



-- ngx.say(data.name,"================")
-- for k,v in pairs(data) do
--   ngx.say("key: ",k,"------------value: ",v)
-- end
-- local SLAXML = require 'slaxdom'
-- local ffi = require "ffi"
-- local xmlData = ngx.req.get_post_args()
-- local xmlStr = xmlData.xmlContent
-- parser = SLAXML:parser{
--   startElement = function(name,nsURI,nsPrefix)
--     ngx.say(name," 0000000000000")
--   end, -- When "<foo" or <x:foo is seen
--   attribute    = function(name,value,nsURI,nsPrefix) end, -- attribute found on current element
--   closeElement = function(name,nsURI)                end, -- When "</foo>" or </x:foo> or "/>" is seen
--   text         = function(text)
--     ngx.say(text," --------")
--   end, -- text and CDATA nodes
--   comment      = function(content)                   end, -- comments
--   pi           = function(target,content)            end, -- processing instructions e.g. "<?yes mon?>"
-- }
-- parser:parse(xmlStr,{stripWhitespace=true})

-- local doc = SLAXML:dom(xmlStr)
-- ngx.say(doc.name)
-- ffi.cdef[[
--   xmlDocPtr	xmlParseDoc(const xmlChar * cur);
--   xmlNodePtr	xmlDocGetRootElement(const xmlDoc * doc);
-- ]]
--
--
-- local dd = ffi.C.xmlParseDoc(xmlStr)
-- local x = ffi.C.xmlDocGetRootElement(dd)
--
-- ngx.say(x)

-- local SLAXML = require 'slaxdom'

-- local xmlData = ngx.req.get_post_args()

-- local xmlStr = xmlData.xmlContent

-- local doc = SLAXML:dom(xmlStr)



-- local result = ""



-- function parserXml(els)
-- 	for i,v in ipairs(els.el) do
-- 		if v.type == 'element' then
-- 			parserXml(v)
-- 		end
-- 		if v.type == 'text' then
-- 			result = result .. ("i=" .. i .. "---type=" .. (v.type) .. "++++name=" .. (v.name) .. '==value=' .. v.value .. '\n')
-- 		else
-- 			result = result .. ("i=" .. i .. "---type=" .. (v.type) .. "++++name=" .. (v.name) .. '\n')
-- 		end
		
-- 	end
-- end

-- parserXml(doc.root)

-- ngx.say(result)