cos, sin, del, circ, all
=
cos, sin, del, circ, all



particles={}
function create_particle(x,y)
  spd=1+rnd(3)
  a=rnd(1)
  vx = spd*cos(a)
  vy = spd*sin(a)
  local p={
    x=x,
    y=y,
    vx=vx,
    vy=vy,
    c=rnd(8)+8,
    s=rnd(3),
    t=0
  }
  add(particles,p)
end


function update_particle(p)
  -- update position
  p.x = p.x + p.vx
  p.y =  p.y + p.vy
  -- slow down the particle
  p.vx = p.vx * 0.9
  p.vy = p.vy * 0.9
  -- update time and delete if old
  p.t = p.t + 0.05
  if p.t>1 then
    del(particles,p)
  end
end

function draw_particle(p)
  circ(p.x,p.y,p.s,p.c)
end
function _draw()
  cls()
  create_particle(64,64)
  for pt in all(particles) do
    update_particle(pt)
    draw_particle(pt)
  end
end
