# rbx-quick-task
My QuickTask Roblox module provides an efficient method for asynchronous function execution using RunService. It schedules tasks to execute at the next frame, which enhances your game's performance. Easy to use, it supports any number of arguments and ensures non-blocking operations. 
@orangebird3, under Arbastro

# QuickTask Module - v1.1.3

QuickTask provides a high-performance, easy-to-use method for asynchronously executing functions. It leverages Roblox's `RunService` to schedule tasks efficiently, and makes sure that they are executed at the start of the next frame, which can be faster than traditional methods like `task.spawn()` or using `BindableEvents`.

-----
### ABOUT THE CREATOR:
Heya, I'm orangebird3, or you can call me Orange, and I made this module mainly for personal usage but decided to make it open source to help out the community. I'm confident there are better modules available, but this should serve your quick and basic usage purposes.
-----
## Features

- **Asynchronous Execution**: Executes functions asynchronously, without blocking the main thread.
- **Frame-Based Scheduling**: Uses `RunService.Heartbeat` to schedule tasks, which is run once per frame.
- **Easy to Use**: Simple API that requires only a function and its arguments.
- **Argument Flexibility**: Supports passing any number of arguments to the function.

## Installation

To install the QuickTask module in your Roblox project:

1. Create a new ModuleScript in the `ReplicatedStorage` or `ServerScriptService` of your game.
2. Name the ModuleScript `QuickTask`.
3. Copy and paste the LuaU code provided in the `mainmodule.lua` file in this repository.

## Usage

Here is how you can use the QuickTask module in your Roblox scripts:

### Requiring the Module

First, you need to require the module in your script:

```lua
local QuickTask = require(game:GetService("ReplicatedStorage"):WaitForChild("QuickTask"))
```

### Using the Module

To spawn a new asynchronous task, simply call the spawn function with the function you want to execute and any arguments:
```lua
QuickTask.spawn(function(name, age)
    print("Hello, " .. name .. " - Age: " .. age)
end, "Jordan", 30)
```
This example will print a greeting message with the name and age, executed asynchronously at the start of the next frame.

### Module Code

The module code is provided in the `mainmodule.lua` file of this repository. For your ease of access, here is the direct module code:

```lua
-- mainmodule.lua
local RunService = game:GetService("RunService")

local QuickTask = {}

function QuickTask.spawn(func, ...)
    assert(type(func) == "function", "First argument must be a function")

    local args = {...}
    local count = select("#", ...)

    RunService.Heartbeat:Connect(function()
        func(table.unpack(args, 1, count))
        return true  -- disconnects the event after running once
    end)
end

return QuickTask
```

## Contributions

Contributions to the QuickTask module are highly welcome from me. If you have suggestions for improvements or have identified issues, please open an issue or submit a pull request.

## License
This module is licensed under an MIT license; this is a permissive license, meaning it carries very few restrictions in these areas.

The MIT License requires two things in your copy and/or modification of the code:

1. The original copyright notice
2. A copy of the license itself

The MIT License does not require those who modify the original code to also release their modification(s) under the same license.
There’s no reciprocity or “pay it forward” requirement, even if you substantially rework the code. Your updated version can remain proprietary.

##### With the MIT License, what can I do?

1. You can use this module in your own projects without any attribution or credit to me.
2. You can redistribute this module in your own projects.
3. You are allowed to modify this module and use it in your own projects.
4. You are allowed to fork this module and use it in your own projects.
5. You are not allowed to hold this module under any sort of patent or copyright, and you are not allowed to claim this module as your own.
6. You are not required to include any of the original copyright notices or license text in your own projects.
7. You are not required to release your modified version of this module under the same license.
8. You are not required to include any of my original copyright notices or license text in your own projects.
9. You are not required to credit me or any of my affiliates in your own projects.
10. You are not required to include this license in your own projects.

##### With the MIT License, what can't I do?
1. You can't claim this module as your own.
2. You can't hold this module under any sort of patent or copyright, and you can't claim this module as your own.
3. You can't resell this module for a profit.

4. You can't use this module to create a competitive game or a game that competes with Roblox.
5. You can't use this module to create a game that is meant to steal or copy the ideas of this module.

## Credits:
@orangebird3 (me) / @arbastro

## TL;DR: 
QuickTask is a Roblox module that executes functions asynchronously using RunService, optimizing game performance by running tasks at the start of the next frame. It's simple to implement and supports multiple arguments.
