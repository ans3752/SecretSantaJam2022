pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
-- 2_moving_body.p8
gift_col={fish=12,phone=3,pc=1}
function _init()
--	head_x
	open_time=clock()
	★,hp,fat=10,10,5
	hand_l_x,hand_r_x=81,90
	hand_y=75
	order={}
	add_order({'fish','news'},clock())
	add_order({'fish','news'},clock())
	add_order({'fish','news'},clock())
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
	move_hand()
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
	cls(13)
	fillp(▒)
	circfill(-69,-91,265,5)
	fillp()
	drw_info()
	drw_order()
	drw_clock(clock(),1,1,8,true)
	drw_body()
	thick_str_chain("hungry!",3,8)
end

function drw_info()
	local n
	for i=1,3 do
		local x,y=1,2+i*7
		if (i==1) n=★
		if (i==2) n=hp
		if (i==3) n=fat
		rectfill(x,y,x+n,y+5,n)
		rect(x,y,x+11,y+5,2)
	end
	color(10)
	print('★',17,9)
		print('hp',17,16)
		print('fat',15,23)
end

function drw_order()
	fillp(▤)
	rectfill(28,1,125,31,2)
	fillp()
	for k,v in pairs(order) do
		local y=3
		local x=103-(k-1)*25
		rectfill(x+1,1,x+22,31,10)
		rectfill(x,2,x+21,32,11)
		for i in all(v.list) do
			?i,x+3,y,0
			y+=6
		end
		print(v.t,x+1,26)
	end
end

-->8
function move_hand()
	local prev_hand_y=hand_y
	local dir=0
	if (btnp(⬇️)) dir=1
	if (btnp(⬆️)) dir=-1
	if hp>0 and dir!=0 then
		hand_y=mid(89,hand_y+dir*14,61)
		if prev_hand_y!=hand_y then
			hp-=1
		end
	end
end

function add_order(tbl, t)
	local o={}
	o.list=tbl
	o.t=t
	add(order,o)
end

function thick_str_chain(str,c1,c2)
	for i in all({{-1,0},{1,0},{0,1},{0,-1}})	do
		str_chain(str,.1,1+i[1],121+i[2],127,c1)
	end
	
		str_chain(str,.1,1,121,127,c2)
end

function str_chain(str,spd,x,y,w,c)
	str..=' '
	clip(x,y,w,y+4)
	for i=1,w/4 do
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
function drw_body()
	local function drw_foot(x,y)
		ovalfill(x-7,y-5,x+8,y+6,8)
		line(x-3,y-5,x+6,y-4,7)
	end
--	left hand
	circfill(hand_l_x,hand_y,5,9)
	circ(hand_l_x,hand_y,5,7)
	
	local head_k=2*sin(tick*5/100)
	local foot_k=tick/10/fat
--	left foot
	drw_foot(98+8*cos(foot_k),101+3*sin(foot_k))
--	body
	ovalfill(82,56,116,99,3)
--	right foot
	drw_foot(98+8*cos(foot_k+.5),101+3*sin(foot_k+.5))
--	head
	ovalfill(87,43+head_k,102,60+head_k,8)
--	arm hole
	circfill(102,73,5,0)
	
--	right hand
	circfill(hand_r_x,hand_y,5,9)
	circ(hand_r_x,hand_y,5,7)
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000fff4f400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770004fffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000ff4ffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700f4ffff4f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000ff4f4f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
