local args = ngx.req.get_uri_args()
ngx.say("过闸:",args["Version"],"---",args["TimeStamp"],"---",args["TransactionCode"])