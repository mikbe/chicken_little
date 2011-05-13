# Chicken Little

A simple hack to disable the incredibly annoying deprecation warnings for `Gem::Specification#default_executable=` when using the `gem` command.

### Usage

**Installing:**  

To properly fix the deprecation warnings run:  
    
    $ chicken_little

Which is short for:
    
    $ chicken_little install
    
If you're still getting errors you can use the old method:  

    $ chicken_little force_install

**Describes how to do it manually**

    $ chicken_little describe_fix

**Uninstalling:**  
To re-enable the deprecation warnings run:  

    $ chicken_little uninstall

**Checking Install Status:**  
To check if it's already installed run:  

    $ chicken_little installed?

**Can it be installed?:**  
To see if it can be installed run:  

    $ chicken_little supported?
    

### What's it do?

Chicken Little hard patches the Rubygems library changing two lines of code commenting out the offending deprecations so warning messages aren't printed for the `Gem::Specification#default_executable=` messsage.

It doesn't stop any other deprecation warnings just the hostile, anti-user default\_executable one.  

### Notes

If you're using RVM you'll need to run this for each gemset.  

Also, as would be expected, you'll need to re-run Chicken Little every time you update the `gem` app.  
