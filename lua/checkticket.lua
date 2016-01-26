local args = ngx.req.get_uri_args()
ngx.say("验票:",args["Version"],"---",args["TimeStamp"],"---",args["TransactionCode"])