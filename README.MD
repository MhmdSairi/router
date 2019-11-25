# DAP-1320 Exploits
Useful scripts for exploiting the D-Link DAP-1320 Wi-Fi Range Extender.
## Directory Traversal
This directory traversal exploit was discovered by [Kyle Lovette](https://packetstormsecurity.com/files/126219/dlinkdap1320-traversalxss.txt). It does not require administrator privileges over the device. The only requirement is that you can access the configuration page.

By default, the web configuration page can be accessed at http://dlinkap/. However, this can be changed by the administrator.

For ease-of-use, I have created [dapbrowser.html](dapbrowser.html). It a simple html/js page that allows you to browse the filesystem of the device simply by entering a path.

I have also created [dapcurl.sh](dapcurl.sh), a simple shell script that uses cURL to download files locally.

### Findings
The list of valid paths that I've discovered can be found in directories.txt.

The file /dev/nvram contains the non-volatile configuration. It stores the administrator password in plaintext, called "admin_password". This file also contains the passwords and SSIDs for both the extended and uplink networks. Definitely check this file out.

The following directories provide information about the processor, RAM and operating system.
- /proc/meminfo
- /proc/cpuinfo
- /proc/sys/kernel/ostype
- /proc/sys/kernel/hostname
- /proc/sys/kernel/osrelease
- /proc/sys/kernel/version
- /proc/sys/kernel/domainname

The /www/ directory contains the web configuration client files.

/var/log/messages_full is the system's log file.