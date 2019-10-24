local withoutnil = require 'without-check-nil'

withoutnil.enable()

assert(nil + 1 == 1)
assert(nil - 1 == -1)
assert(nil * 1 == 0)
assert(nil / 1 == 0)
assert(nil % 1 == 0)
assert(nil ^ 1 == 0)
assert(-nil == 0)
assert(nil .. 'abc' == 'abc')
assert(#nil == 0)
assert(nil < 0 == false)
assert(nil <= 0 == true)
assert(nil > 0 == false)
assert(nil >= 0 == true)
assert((nil)[1][2][3][4][5] == nil)
;(nil)[1][2][3][4][5] = 1
(nil)()
for _ in pairs(nil) do
    print(_)
end
for _ in ipairs(nil) do
    print(_)
end
assert(nil // 1 == 0)
assert(nil & 10 == 0)
assert(nil | 10 == 10)
assert(nil ~= 10 == 0 ~= 10)
assert(~ nil == ~ 0)
assert(nil << 1 == 0)
assert(nil >> 1 == 0)
assert(1 << nil == 1)
assert(1 >> nil == 1)

function withoutnil.watch(event, ...)
    if event == '__add' then
        local x, y = ...
        return true, ((x or 0) + (y or 0)) / 2
    end
end

assert(nil + 10 == 5)
assert(nil - 10 == -10)

withoutnil.disable()

assert(pcall(function () return nil + 1 end) == false)
