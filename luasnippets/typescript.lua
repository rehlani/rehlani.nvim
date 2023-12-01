local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

-- helpers
local capitalize = function(index)
  return f(function(arg)
    local input = arg[1][1]
    -- check if input is null or empty
    if not input or input == "" then
      return ""
    end
    -- get the first character and make it uppercase
    local first = string.upper(string.sub(input, 1, 1))
    -- get the rest of the string and keep it lowercase
    local rest = string.lower(string.sub(input, 2))
    -- return the concatenated string
    return first .. rest
  end, { index })
end

-- shared between typescript and typescript react
local jestTestSnippet = s(
  "jit",
  fmt(
    [[
  it('{}',{} () => {{
    {}
  }})
  ]],
    { i(1), c(2, { t(""), t("async") }), i(0) }
  )
)

print("GOT HERE")
return {
  typescript = {
    jestTestSnippet,
  },
  typescriptreact = {
    s(
      "rfc",
      fmt(
        [[
  interface {}Props {{
  }}
  
  const {}: React.FC<{}Props> = () => {{
  
    return <></>
  }}
  ]],
        { i(1), rep(1), rep(1) }
      )
    ),
    s("ust", fmt("const [{}, set{}] = useState({})", { i(1), capitalize(1), i(2) })),
    jestTestSnippet,
  },
}
