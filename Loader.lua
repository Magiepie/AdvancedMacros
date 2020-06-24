local files = filesystem.list("~macros/MScape")

toast("FILE","loading mScape Files...")
for a, b in pairs(files) do
  local pass, err = pRun("~macros/MScape/"..b)
  if not pass then
    log("&cstartup&7/&c"..b.."&4 "..err)
  end
end