-- mod-version:3

local core = require "core"
local command = require "core.command"
--local config = require "core.config"
--local common = require "core.common"

local function lint()

  local doc = core.active_view.doc
  local command = string.format("ansible-lint --offline --nocolor --parseable %s 2>&1", doc:get_name())
  local result = core.open_doc("ansible_linter.txt")

  core.log("Starting ansible linter with: " .. command )
  local proc = process.start { "sh", "-c", command }

  while true do
    -- 8KB at a time
    local read_buffer = proc:read_stdout(8192)
    if read_buffer then
      local nlines = #result.lines
      local iline = nlines + 1
      local text = string.gsub(read_buffer, '[ \t]+\n', '\n')
      result:insert(iline, 1, text)
      -- os.execute("sleep " .. 0.2)
    else
      break
    end
  end

  core.root_view:open_doc(result)
  result.new_file = false
  result:clean()

end

command.add("core.docview", {["ansible:linter"] = lint})

