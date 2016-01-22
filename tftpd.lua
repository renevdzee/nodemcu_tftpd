_tblk=0
s=net.createServer(net.UDP)
s:on("receive",function(c,r) 
  local op=string.byte(r,2)
  if(op==2)then
    local fn=string.match(r,"..(%Z+)")
    uart.write(0,"TFTP '"..fn.."': ")
    _tblk=1
    file.open(fn,"w")
    c:send("\0\4\0\0")
  elseif(op==3)then
    local b=string.byte(r,3)*256+string.byte(r,4)
    local sz=string.len(r)-4
    uart.write(0,"#")
    if(b==_tblk)then
      c:send("\0\4"..string.sub(r,3,4))
      _tblk=b+1
      file.write(string.sub(r,5))
    end
    if(sz~=512)then
      print(" done!")
      file.close()
    end
    collectgarbage()
  else
    c:send("\0\5\0\4\0")
  end
end) 
s:listen(69)
print("TFTP server started")