# Configure Commandable
require 'commandable'
Commandable.color_output = true
Commandable.verbose_parameters = false
Commandable.app_exe = "chicken_little"
Commandable.app_info =
"""
  \e[92mChicken Little\e[0m - Disables the annoying deprication warnings from the gem command.
    It's only been tested on OS X and Linux but I know it won't work on Windows.
    Copyright (c) 2011 Mike Bethany
"""
