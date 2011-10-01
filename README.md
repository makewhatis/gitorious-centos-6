# Install procedures

For installing Gitorious in latest Centos 6 x86_64 stable using Opscode Chef for a completely automated process, follow these instructions:

    wget -O /root/chef-solo-prep.sh https://raw.github.com/gist/1250850/bd6a4f86c6f91aa1e1d8ae595fe2b529603f5513/gistfile1.sh 
    bash /root/chef-solo-prep.sh
First review the settings under /root/chef-solo/node.json. Change all settings that you would like to customize, notification email, host, etc.

TODO: Currently need to setup an email server. Then procede with:

    chef-solo

# Troubleshoot

If you have any problems, please fill the issue [here](https://github.com/makewhatis/gitorious-centos-6/issues).

