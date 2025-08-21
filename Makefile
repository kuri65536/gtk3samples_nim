build: \
       bin/simplec \
       bin/simple \
       bin/app \
       bin/keys \
       bin/timer \
       bin/draw_image \


bin/keys: keys.nim
	nim c -o:$@ $<


bin/draw_image: draw_image.nim gtypes.nim cairo.nim pixbuf.nim
	nim c -o:$@ --threads:on $<


bin/app: app.nim
	nim c -o:$@ $<


bin/timer: timer.nim
	nim c -o:$@ $<


bin/simple: simple.nim
	nim c -o:$@ $<


bin/simplec: simple.c
	gcc -o $@ $< `pkg-config --cflags --libs gtk+-3.0`

