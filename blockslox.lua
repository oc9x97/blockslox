-- if your just here to steal code remove the tp stuff
local newPosition = Vector3.new(176, 5, -32)

local player = game.Players.LocalPlayer

player.Character:SetPrimaryPartCFrame(CFrame.new(newPosition))

local chat = function(MSG) -- creo thing
 game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(MSG, "All")
end
chat("Hello I am Blockslox Bot! Say !cmds for commands!")
wait(1)
chat("Commands: -move forward, -move backward, -move leftward, -move rightward, -jump,")
chat("-shiftlock on, -shiftlock off, -stop moving, -dance, -dance1, -dance2, -dance3, -cheer, -laugh, -reset, -cmds")
local keys = {
 ["a"] = 0x41,
 ["b"] = 0x42,
 ["c"] = 0x43,
 ["d"] = 0x44,
 ["e"] = 0x45,
 ["f"] = 0x46,
 ["g"] = 0x47,
 ["h"] = 0x48,
 ["i"] = 0x49,
 ["j"] = 0x4A,
 ["k"] = 0x4B,
 ["l"] = 0x4C,
 ["m"] = 0x4D,
 ["n"] = 0x4E,
 ["o"] = 0x4F,
 ["p"] = 0x50,
 ["q"] = 0x51,
 ["r"] = 0x52,
 ["s"] = 0x53,
 ["t"] = 0x54,
 ["u"] = 0x55,
 ["v"] = 0x56,
 ["w"] = 0x57,
 ["x"] = 0x58,
 ["y"] = 0x59,
 ["z"] = 0x5A,
 ["0"] = 0x30,
 ["1"] = 0x31,
 ["2"] = 0x32,
 ["3"] = 0x33,
 ["4"] = 0x34,
 ["5"] = 0x35,
 ["6"] = 0x36,
 ["7"] = 0x37,
 ["8"] = 0x38,
 ["9"] = 0x39,
 ["+"] = 0xBB,
 ["-"] = 0xBD,
 [","] = 0xBC,
 ["."] = 0xBE,
 ["quote"] = 0xDE,
 ["esc"] = 0x1B,
 ["tab"] = 0x09,
 ["caps"] = 0x14,
 ["lshift"] = 0xA0,
 ["rshift"] = 0xA1,
 ["ctrl"] = 0x11,
 ["lctrl"] = 0xA2,
 ["rctrl"] = 0xA3,
 ["lwin"] = 0x5B,
 ["rwin"] = 0x5C,
 ["alt"] = 0x12,
 ["space"] = 0x20,
 ["enter"] = 0x0D,
 ["backspace"] = 0x08,
 ["sshot"] = 0x2C,
 ["scrolllock"] = 0x91,
 ["pause"] = 0x13,
 ["insert"] = 0x2D,
 ["home"] = 0x24,
 ["pgup"] = 0x21,
 ["del"] = 0x2E,
 ["end"] = 0x23,
 ["pgdn"] = 0x22,
 ["up_a"] = 0x26,
 ["down_a"] = 0x28,
 ["left_a"] = 0x25,
 ["right_a"] = 0x27,
 ["numlock"] = 0x90,
 ["sleep"] = 0x5F,
 ["n_0"] = 0x60,
 ["n_1"] = 0x61,
 ["n_2"] = 0x62,
 ["n_3"] = 0x63,
 ["n_4"] = 0x64,
 ["n_5"] = 0x65,
 ["n_6"] = 0x66,
 ["n_7"] = 0x67,
 ["n_8"] = 0x68,
 ["n_9"] = 0x69,
 ["v_mute"] = 0xAD,
 ["v_up"] = 0xAF,
 ["v_down"] = 0xAE,
 ["next_t"] = 0xB0,
 ["prev_t"] = 0xB1,
 ["stop_t"] = 0xB2,
 ["pause_t"] = 0xB3,
 ["f1"] = 0x70,
 ["f2"] = 0x71,
 ["f3"] = 0x72,
 ["f4"] = 0x73,
 ["f5"] = 0x74,
 ["f6"] = 0x75,
 ["f7"] = 0x76,
 ["f8"] = 0x77,
 ["f9"] = 0x78,
 ["f10"] = 0x79,
 ["f11"] = 0x7A,
 ["f12"] = 0x7B,
}

function hold(mousebutton)
 if mousebutton == "left" then
  mouse1down()
 elseif mousebutton == "right" then
  mouse2down()
 end
end

function release(mousebutton)
 if mousebutton == "left" then
  mouse1up()
 elseif mousebutton == "right" then
  mouse2up()
 end
end

function click(mousebutton)
 if mousebutton == "left" then
  mouse1click()
 elseif mousebutton == "right" then
  mouse2click()
 end
end

function move(x,y)
 mousemoveabs(x,y)
end

function scroll(p)
 mousescroll(p)
end

function loopmove(x,y)
 if canmove2 ~= false then
  canmove1 = false
  spawn(function()
   local l
   l = game:GetService("RunService").Heartbeat:Connect(function()
    if canmove1 == true then
     l:Disconnect()
    end
    wait()
    move(x,y)
   end)
  end)
 end
end

function breakmove()
 canmove1 = false
end

local mouse = game:GetService("Players").LocalPlayer:GetMouse()
canmove2 = true
function togglemove()
 if canmove1 ~= false then
  if canmove2 == false then
   canmove2 = true
  elseif canmove2 == true then
   canmove2 = false
   mx = mouse.X
   my = mouse.Y
   spawn(function()
    local l
    l = game:GetService("RunService").Heartbeat:Connect(function()
     if canmove2 == true then
      l:Disconnect()
     end
     wait()
     move(mx,my)
    end)
   end)
  end
 end
end

function type(string)
 for _,char in pairs(string:split("")) do
  wait(0.01)
  if char == " " then
   keypress(keys["space"])
  else
   if char:upper() == char and (char ~= "," and char ~= "." and char ~= "-" and char ~= "+" and char ~= "'" and char ~= '"' and char ~= "<" and char ~= ">" and char ~= "_" and char ~= "=") then
    keypress(keys["lshift"])
    keypress(keys[char:lower()])
                keyrelease(keys["lshift"])
   else
    if char == "'" then
     keyrelease(keys["caps"])
     keyrelease(keys["lshift"])
     keypress(keys["quote"])
    elseif char == '"' then
     keyrelease(keys["caps"])
     keypress(keys["lshift"])
     keypress(keys["quote"])
     keyrelease(keys["lshift"])
    elseif char == "<" then
     keyrelease(keys["caps"])
     keypress(keys["lshift"])
     keypress(keys[","])
     keyrelease(keys["lshift"])
    elseif char == ">" then
     keyrelease(keys["caps"])
     keypress(keys["lshift"])
     keypress(keys["."])
     keyrelease(keys["lshift"])
    elseif char == "_" then
     keyrelease(keys["caps"])
     keypress(keys["lshift"])
     keypress(keys["-"])
     keyrelease(keys["lshift"])
    elseif char == "=" then
     keyrelease(keys["caps"])
     keypress(keys["lshift"])
     keypress(keys["+"])
     keyrelease(keys["lshift"])
    else
     keyrelease(keys["caps"])
     keyrelease(keys["lshift"])
     keypress(keys[char])
    end
   end
  end
 end
end



local chatEvents = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents")
local messageDoneFiltering = chatEvents:WaitForChild("OnMessageDoneFiltering")

messageDoneFiltering.OnClientEvent:Connect(function(message)
 local msg = message.Message or ""
 
 
 
 print(msg)
  if msg:lower():sub(1,13) == "-move forward" then
   keyrelease(keys["s"])
   keypress(keys["w"])
  end

  if msg:lower():sub(1,14) == "-move backward" then
   keyrelease(keys["w"])
   keypress(keys["s"])
  end

  if msg:lower():sub(1,14) == "-move leftward" then
   keyrelease(keys["d"])
   keypress(keys["a"])
  end

  if msg:lower():sub(1,15) == "-move rightward" then
   keyrelease(keys["a"])
   keypress(keys["d"])
  end

  if msg:lower():sub(1,13) == "-shiftlock on" then
   keypress(keys["lshift"])
   keyrelease(keys["lshift"])
  end

  if msg:lower():sub(1,14) == "-shiftlock off" then
   keypress(keys["lshift"])
   keyrelease(keys["lshift"])
  end

  if msg:lower():sub(1,12) == "-stop moving" then
   keyrelease(keys["w"])
   keyrelease(keys["s"])
   keyrelease(keys["a"])
   keyrelease(keys["d"])
  end

  if msg:lower():sub(1,5) == "-wave" then
   game.Players:Chat("/e wave")
  end

  if msg:lower():sub(1,6) == "-point" then
   game.Players:Chat("/e point")
  end

  if msg:lower():sub(1,6) == "-cmds" then
   chat("Commands: -move forward, -move backward, -move leftward, -move rightward, -jump,")
   chat("-shiftlock on, -shiftlock off, -stop moving, -dance, -dance1, -dance2, -dance3,")
   chat("-cheer, -laugh, -reset, -point, -wave, -cmds")
  end

  if msg:lower():sub(1,6) == "-cheer" then
   game.Players:Chat("/e cheer")
  end

  if msg:lower():sub(1,6) == "-laugh" then
   game.Players:Chat("/e laugh")
  end

  if msg:lower():sub(1,6) == "-reset" then
   game.Players.LocalPlayer.Character:BreakJoints()
  end

  if msg:lower():sub(1,6) == "-sit" then
   game.Players.LocalPlayer.Character.Humanoid.Sit = true
  end

  if msg:lower():sub(1,6) == "-dance" then
   game.Players:Chat("/e dance")
  end

  if msg:lower():sub(1,7) == "-dance1" then
   game.Players:Chat("/e dance1")
  end

  if msg:lower():sub(1,7) == "-dance2" then
   game.Players:Chat("/e dance2")
  end

  if msg:lower():sub(1,7) == "-dance3" then
   game.Players:Chat("/e dance3")
  end

  if msg:lower():sub(1,12) == "-rotate left" then
   keyrelease(keys["right_a"])
   keypress(keys["left_a"])
  end

  if msg:lower():sub(1,13) == "-rotate right" then
   keyrelease(keys["left_a"])
   keypress(keys["right_a"])
  end

  if msg:lower():sub(1,12) == "-rotate stop" then
   keyrelease(keys["right_a"])
   keyrelease(keys["left_a"])
  end

  if msg:lower():sub(1,5) == "-jump" then
   keypress(keys["space"])
   wait(0.1)
   keyrelease(keys["space"])
  end

  print("loaded")
 
end)
