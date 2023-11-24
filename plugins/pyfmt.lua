-- mod-version:3

-- Automatic formatter for python code
-- Dependencies: `black` command in PATH or whatever formatter is chosen in
-- configuration

-- This is a slightly re-written version of https://git.sr.ht/~tmpod/black-lite

-- Run with
--   Pyfmt: format

-- Imports
local core = require "core"
local command = require "core.command"
local config = require "core.config"
local common = require "core.common"

-- Config
config.plugins.pyfmt = common.merge({
  enabled = true,
  exec = "black",
  args = "",
  config_spec = {
    name = "Python Code Formatter",
    {
      label = "Formatter command",
      description = "Path to executable.",
      path = "exec",
      type = "string",
      default = "black"
    },
    {
      label = "Formatter arguments",
      description = "Command line arguments.",
      path = "args",
      type = "string",
      default = "",
    }
  }
}, config.plugins.pyfmt)

-- Main logic
local function format()

  -- Save the file if it is unsaved or dirty
  local doc = core.active_view.doc
  if doc:get_name() == "unsaved" or doc:is_dirty() then
    doc:save()
  end

  -- Run command
  local ok, _, code = os.execute(
    string.format(
      "%s %s %s",
      config.plugins.pyfmt.exec,
      config.plugins.pyfmt.args,
      doc:get_name()
    )
  )

  -- Return with error code if any
  if not ok then
    core.log("Failed to format file, return code is " .. code)
    return
  end

  -- Log success and reload file
  core.log("File is reformatted, reloading document")
  doc:reload()
end

-- Register the command
command.add("core.docview", {["pyfmt:format"] = format})

