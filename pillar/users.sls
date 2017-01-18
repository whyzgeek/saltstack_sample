# Note that changes in here might not reflected like: 
# 1- Deleting a user. You might need to run salt \* users.delete <username> after deleting config
# 2- User group memberships removals, shell changes don't get reflected.
# 3- The authorized keys follow the same rule. To remove the key you need to first get their list by:
#    salt \* ssh.auth_keys <username> 
#    and then
#    salt \* ssh.rm_auth_key <user> <key>
# 4- Public keys of the user should be in salt://pub_keys/<username>.pub
groups:
    devs:
      gid: 1001
      users:
        whyzgeek:
            name: whyzgeek
            uid: 2001
            pkey: True
            password: x
    ops:
        gid: 1000
        users:
          deploy:
            name: Deploy user
            uid: 2000
            shell: /bin/bash
            pkey: True
            password: x

