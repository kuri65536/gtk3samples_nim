##[
gtypes.nim
=================
a straight conversion for gtk+-3.0 sample.


License (MPL2)::

```
  Copyright (c) 2022, shimoda as kuri65536 _dot_ hot mail _dot_ com
                        ( email address: convert _dot_ to . and joint string )

  This Source Code Form is subject to the terms of the Mozilla Public License,
  v.2.0. If a copy of the MPL was not distributed with this file,
  You can obtain one at https://mozilla.org/MPL/2.0/.
```
]##
{.passC: gorge("pkg-config --cflags gtk+-3.0").}
{.emit: "#include <glib-object.h>".}


type
  gboolean* = distinct cint
  gpointer* = pointer

  GBytesObj* = object of RootObj
  GBytes* = ptr GBytesObj


#[ compile errors in clang 20.1.8
proc g_bytes_unref*(src: GBytes): void {.importc: "g_bytes_unref".}
]#
proc g_bytes_unref*(src: GBytes): void =
    {.emit: "g_bytes_unref(`src`);".}

#[ segfault
proc newGBytes*(src: openarray): GBytes {.importc: "g_bytes_new".}
]#
#[ compile errors in clang 20.1.8
proc newGBytes*(src: ptr byte, size: cint): GBytes {.importc: "g_bytes_new".}
]#
proc newGBytes*(src: ptr byte, size: cint): GBytes =
    {.emit: "g_bytes_new(`src`, `size`);".}


const
  gfalse* = gboolean(0)
  gtrue* = gboolean(1)

