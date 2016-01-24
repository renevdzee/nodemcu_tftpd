# nodemcu_tftpd

  A simple nodemcu lua tftp server to upload your nodemcu lua files over the Wifi connection

## Installation

  Upload the with f.e. lualoader
  then compile using

```lua
node.compile("tftpd.lua")
```
 and optionally remove the lua file to save some flash space

```lua
file.remove("tftpd.lua")
```

## Start

  To run the tftp server:
  
```lua
dofile("tftpd.lc")()
```

  To auto-start the tftp server add the line above to your init.lua
