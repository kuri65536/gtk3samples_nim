bin/keys: keys.nim
	nim c -o:$@ $<


bin/draw_image: draw_image.nim
	nim c -o:$@ --threads:on $<


bin/app: app.nim
	nim c -o:$@ $<


bin/timer: timer.nim
	nim c -o:$@ $<


bin/simple: simple.nim
	nim c -o:$@ $<


bin/simplec: simple.c
	gcc -o $@ $< `pkg-config --cflags --libs gtk+-3.0`

