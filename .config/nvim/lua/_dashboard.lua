--   local home = os.getenv('HOME')
-- local db = require('dashboard')
--   db.custom_header = {
--   [[               ▄▄██████████▄▄             ]],
--   [[               ▀▀▀   ██   ▀▀▀             ]],
--   [[       ▄██▄   ▄▄████████████▄▄   ▄██▄     ]],
--   [[     ▄███▀  ▄████▀▀▀    ▀▀▀████▄  ▀███▄   ]],
--   [[    ████▄ ▄███▀              ▀███▄ ▄████  ]],
--   [[   ███▀█████▀▄████▄      ▄████▄▀█████▀███ ]],
--   [[   ██▀  ███▀ ██████      ██████ ▀███  ▀██ ]],
--   [[    ▀  ▄██▀  ▀████▀  ▄▄  ▀████▀  ▀██▄  ▀  ]],
--   [[       ███           ▀▀           ███     ]],
--   [[       ██████████████████████████████     ]],
--   [[   ▄█  ▀██  ███   ██    ██   ███  ██▀  █▄ ]],
--   [[   ███  ███ ███   ██    ██   ███▄███  ███ ]],
--   [[   ▀██▄████████   ██    ██   ████████▄██▀ ]],
--   [[    ▀███▀ ▀████   ██    ██   ████▀ ▀███▀  ]],
--   [[     ▀███▄  ▀███████    ███████▀  ▄███▀   ]],
--   [[       ▀███    ▀▀██████████▀▀▀   ███▀     ]],
--   [[         ▀    ▄▄▄    ██    ▄▄▄    ▀       ]],
--   [[              ▀████████████▀             ]],
--   [[]],
--   }
--  db.custom_center = {
--     {
--       icon = '🦾 ',
--       desc = 'Ain’t no fellow who regretted giving it one extra shake, but you can bet every guy has regretted giving one too few.',
--     },
-- }

require('dashboard').setup({
  theme = 'hyper',
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      {
        desc = ' Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
    },
  },
})
