# linux-sandbox

linux-sandbox runs commands in a restricted environment where they are
subject to a few rules:
 - The entire filesystem is made read-only.
 - The working directory (-W) will be made read-write, though.
 - Individual files or directories can be made writable (but not deletable)
   (-w).
 - If the process takes longer than the timeout (-T), it will be killed with
   SIGTERM. If it does not exit within the grace period (-t), it all of its
   children will be killed with SIGKILL.
 - tmpfs can be mounted on top of existing directories (-e).
 - If option -R is passed, the process will run as user 'root'.
 - If option -U is passed, the process will run as user 'nobody'.
 - Otherwise, the process runs using the current uid / gid.
 - If linux-sandbox itself gets killed, the process and all of its children
   will be killed.
 - If linux-sandbox's parent dies, it will kill itself, the process and all
   the children.
 - Network access is allowed, but can be disabled via -N.
 - The hostname and domainname will be set to "sandbox".
 - The process runs in its own PID namespace, so other processes on the
   system are invisible.