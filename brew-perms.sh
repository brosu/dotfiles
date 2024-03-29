#!/bin/sh
# Configure homebrew permissions to allow multiple users on MAC OSX.
# Any user from the admin group will be able to manage the homebrew and cask installation on the machine.

# allow admins to manage homebrew's local install directory
chgrp -R admin /usr/local
chmod -R g+w /usr/local

# allow admins to homebrew's local cache of formulae and source files
chgrp -R admin /Library/Caches/Homebrew
chmod -R g+w /Library/Caches/Homebrew

# if you are using cask then allow admins to manager cask install too
chgrp -R admin /opt/homebrew-cask
chmod -R g+w /opt/homebrew-cask

# if you are using cask then allow admins to manager cask install too
chgrp -R admin /opt/homebrew
chmod -R g+w /opt/homebrew