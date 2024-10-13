cos, sin, del, circ, all, pset
=
cos, sin, del, circ, all, pset



particles={}
function create_particle(x,y)
  spd=1+rnd(3)
  a=rnd(1)
  vx = spd*cos(a)
  vy =  -4
	local colors = { 6, 7, 8 }
	local ci = flr(rnd(#colors)) +1
  local p={
		init_y=y,
    x=x,
    y=y,
    vx=vx,
    vy=vy,
    c=colors[ci],
    t=0
  }
  add(particles,p)
end


function update_particle(p)
  -- update position
  p.x = p.x + p.vx
  p.y =  p.y + p.vy

  p.vx = p.vx * 0.5
  p.vy = p.vy + 2
	local numbers = { 2, 3, 3, 3, 4, 4, 5, 6 }
	local index = flr(rnd(#numbers)) + 1
  p.t = p.t + 0.05
  if p.y > p.init_y + numbers[index] then
    del(particles,p)
  end
end

function draw_particle(p)
  pset(p.x,p.y,p.c)
end


time = 0
function _draw()
  cls()
	if time < 15 then
		create_particle(64,64)
		create_particle(64,63)
		for pt in all(particles) do
			update_particle(pt)
			draw_particle(pt)
		end
	end
	time = time + 1
end
