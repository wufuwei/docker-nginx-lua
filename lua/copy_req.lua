local res1, res2, action
action = ngx.var.request_method
if action == "POST" then
	arry = {method = ngx.HTTP_POST, body = request_body}
else
	arry = {method = ngx.HTTP_GET}
end

if ngx.var.svr == "on" then
	res1, res2 = ngx.location.capture_multi {
		{ "/iot" .. ngx.var.request_uri , arry},
		{ "/agent-wy" .. ngx.var.request_uri , arry},
	}	
else
	res1, res2 = ngx.location.capture_multi {
		{ "/iot" .. ngx.var.request_uri , arry},
	}
end

if res1.status == ngx.HTTP_OK then
	local header_list = {"Content-Length", "Content-Type", "Content-Encoding", "Accept-Ranges"}
	for _, i in ipairs(header_list) do
		if res1.header[i] then
			ngx.header[i] = res1.header[i]
		end
	end
	ngx.say(res1.body)
else
	ngx.status = ngx.HTTP_NOT_FOUND
end
