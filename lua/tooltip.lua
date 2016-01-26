local tooltip = {}

function tooltip.ParserXml(data,result)
	if table.getn(data) > 1 then
		for i,v in ipairs(data) do
			tooltip.ParserXml(v,result)
		end
	else
		result[data.xml] = data[1]
	end
	return result
end

return tooltip