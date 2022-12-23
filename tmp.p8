pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
-- 1_play_background.p8
gift_col={fish=12,phone=3,pc=1}
function _init()
--	head_x0
	open_time=clock()
	★,fat,hp=10,10,10
	order={}
	add_order({'fish','news'},clock())
	_upt=upt_play
	_drw=drw_play
	tick=0
end

function _update()
	tick+=1
	_upt()
end

function _draw()
	_drw()
end
-->8
function upt_start()
	if btnp(❎) then
		_upt=upt_front
		_drw=drw_front
	end
end

function upt_play()
	
end
-->8
function drw_start(spd)
	cls(12)
	fillp(⬆️)
	rectfill(0,0,127,127,11)
	fillp()
	str_chain("go to work with ❎",-.4,21,35,86,7)
	str_chain(open_time,.15,21,53,26,8)
end

function drw_play()
	cls(9)
	drw_stat()
	drw_order()
	drw_clock(clock(),1,1,8,true)
end
-->8
function drw_stat()
	for i=0,2 do
		rect(1,9+i*7,12,14+i*7,2)
	end
	print('★',17,9,14)
		print('hp',17,16,14)
		print('fat',15,23,13)
end

function drw_order()
	local y=4
	fillp(▤)
	rectfill(28,1,125,31,2)
	fillp()
	for k,v in pairs(order) do
		local x=103-(k-1)*26
		rectfill(x+1,1,x+22,31,10)
		rectfill(x,2,x+21,32,11)
		for i in all(v.list) do
			?i,x+3,y,0
			y+=6
		end
		print(v.t,x+1,26)
	end
end

function add_order(tbl, t)
	local o={}
	o.list=tbl
	o.t=t
	add(order,o)
end

function str_chain(str,spd,x,y,w,c)
	str..=' '
	clip(x,y,w,y+4)
	for i=1,30 do
		local char=str[(i+flr(tick*spd))%#str+1]
		print(char,x,y,c)
		x+=char>'█'and 8 or 4
	end
	clip()
end

function upt_tick()
	tick+=1
end

function clock()
	local str=''
	for i=93,94 do
		local s=tostr(stat(i))
		if (#s<2) s='0'..s
		if (i!=94) s=s..':'
		str..=s
	end
	return str
end

function drw_clock(str,x,y,c,blink)
	if stat(95)%2==0 
	and blink==true then
		str=sub(str,1,2)..' '..sub(str,4,5)
	end
	print(str,x,y,c)
end
-->8
--santa

ovalfill(82,56,116,99,3)
oval(81,101,96,111,8)
ovalfill(86,42,101,59,8)
oval(102,99,116,110,8)
circfill(102,73,5,0)
circfill(95,80,5,9)
line(102,73,95,81,13)
circfill(81,68,5,9)
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
