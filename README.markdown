# Chicken Little

A simple hack to disable the incredibly annoying deprecation warnings for `Gem::Specification#default_executable=` when using the `gem` command.

### Usage

**Installing:**  

To install from a command line run:  
    
    $ chicken_little

If you like to being verbose you can run:  

    $ chicken_little install

**Uninstalling:**  
When they come to their senses and realize the ridiculous deprecation warnings makes it virtually impossible to work you can uninstall Chicken Little by running:  

    $ chicken_little uninstall

**Checking Install Status:**  
To check if it's already installed run:  

    $ chicken_little installed?

**Can it be installed?:**  
To see if it can be installed run:  

    $ chicken_little supported?
    

### What's it do?

Chicken Little hard patches the Rubygems library changing a single line of code so warning messages aren't printed for the `Gem::Specification#default_executable=` messsage.

It doesn't stop any other deprecation warnings, just the hostile, anti-user default\_executable one.  

### Notes

If you're using RVM you'll need to run this for each gemset.  

Also, as would be expected, you'll need to re-run Chicken Little every time you update the `gem` app.  
