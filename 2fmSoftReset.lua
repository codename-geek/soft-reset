function _OnInit()
    kh2libstatus, kh2lib = pcall(require, "kh2lib")
    if not kh2libstatus then
        print("ERROR (Soft Reset): KH2-Lua-Library mod is not installed")
        CanExecute = false
        return
    end

    Log("KH2 Soft Reset 3.0.0")
    RequireKH2LibraryVersion(1)
    RequirePCGameVersion()

    CanExecute = kh2lib.CanExecute
    if not CanExecute then
        return
    end

    Input = kh2lib.Input
    SoftReset = kh2lib.SoftReset
    RNG = kh2lib.RNG
    Spawns = kh2lib.Spawns
end

function _OnFrame()
    if not CanExecute then
        return
    end

    if ReadInt(Input) == 247042 then
        WriteArray(Now+0x00, {0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF})
        WriteArray(Now+0x10, {0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF})
        WriteArray(Now+0x20, {0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF})
        WriteArray(Now+0x30, {0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF})
        WriteByte(SoftReset, 1)
        WriteInt(RNG, 0x00000001)
        WriteByte(Spawns, 0)
    end
end
