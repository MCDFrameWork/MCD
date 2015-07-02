--require "test"

function hello()
	print 'hello'
end

function __G__TRACKBACK( msg )
	print("-------------------------------")
	print("LUA ERROR: "..tostring(msg).."\n")
	print(debug.traceback())
	print("-------------------------------")
end

function main()
	hello()
require "test"

	hello1()
end

local status, msg = xpcall(main,__G__TRACKBACK)
if not status then
	error(status)
end	
