return {
  "blink-shell/blink.cmp",
  config = function()
    local blink = require("blink.cmp")
    blink.setup({
        
        keymap = {
            preset = 'super-tab'
        }
    })
  end,
}
