local online, test, action
action = ngx.var.request_method

if action == "POST" then
    ngx.req.read_body() -- 解析 body 参数之前一定要先读取 body
    local arg = ngx.req.get_post_args() -- post需要参数传递
    arry = {method = ngx.HTTP_POST, body = ngx.var.request_body, args=''}
else
    arry = {method = ngx.HTTP_GET}
end

if ngx.var.svr == "on" then
  online, test = ngx.location.capture_multi {
   { "/online" .. ngx.var.request_uri, arry},
   { "/test" .. ngx.var.request_uri, arry},
 }
else
   online = ngx.location.capture_multi {
       { "/online" .. ngx.var.request_uri, arry}
   }
end

if online.status == ngx.HTTP_OK then -- 只返回online server的结果
  ngx.say(online.body)
else
  ngx.status = ngx.HTTP_NOT_FOUND
end
