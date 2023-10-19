# NI-import-own-nicnt-files
Perl script to find Native Instruments nicnt files for Kontakt instruments not from NI

## None signed NI Kontakt instruments

If you are using Kontakt from Native Instruments, it shows by default
just the licensed instruments. But there is a trick to bring also
other instruments to Kontakt.

First you must use a tool like Kontakted to create the required
nicnt and wallpaper files.

https://www.abyssmultimedia.com/Kontacted/

## More requirements


- Install git bash for Windows (to run this script)

- Kontakt 5.6 

I think, if you own a license, you can download it here:

https://www.native-instruments.com/en/support/downloads/update-manager/?q=Kontakt&t=updates




## Steps

Described for Windows 10

And you need to get the old Kontakt 5.

- Give Write permission for you or all users to: c:\Program Files\Common Files\Native Instruments\Service Center
- Use Kontakted to create the *.nicnt and wallpaper.png for your instrument
- Start Kontakt 5 as administrator
- Add the new library to Kontakt.

You will see the new library, but it will disappear when restarting Kontakt!

- Go in explorer to your base Kontakt-Libraries folder, where all your non-singed instrument libraries are in.
- Download the script from this git repository to that folder.
- Start a git-bash in this folder
- start the script with that line:


```
perl importownlibs.pl
```

If everything worked, you may want to start now Kontakt 6 and the instrument-libraries are listed.



## More

If you want to remove a registered instrument from your Kontakt. Use that tool:

```
NI Uninstall RegTool_64bit.exe
```

https://support.native-instruments.com/hc/en-us/articles/115003509269-Fixing-Software-Update-Installation-Issues-Windows-

