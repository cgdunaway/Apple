#!/bin/zsh

/usr/bin/security authorizationdb write system.preferences "allow"
/usr/bin/security authorizationdb write com.apple.DiskManagement.reserveKEK "authenticate-session-owner"
/usr/bin/security authorizationdb write system.services.directory.configure "authenticate-session-owner"
/usr/bin/security authorizationdb write system.preferences.security "authenticate-session-owner"
