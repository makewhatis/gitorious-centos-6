# Install procedures

For installing Gitorious in latest Centos 6 x86_64 stable using Opscode Chef.  For a completely automated process, follow these instructions:

This is a modified version of https://github.com/rosenfeld/gitorious-cookbooks that was originally made for Ubuntu 10.10

    wget -O /root/chef-solo-prep.sh https://raw.github.com/gist/2d3e996ae10129596afa/68acab43c020627a996d8722bd92ea5c2d7eadb5/gitorious-cent6-prep.sh 
    bash /root/chef-solo-prep.sh

First review the settings under /root/chef-solo/node.json. Change all settings that you would like to customize, notification email, host, etc. Then procede with running chef-solo from the /root/chef-solo directory:

    chef-solo

# Troubleshoot

If you have any problems, please fill the issue [here](https://github.com/makewhatis/gitorious-centos-6/issues).



# TODO: 

- Currently need to setup the SMTP recipe, currently this doesnt configure that part.
- Need to fix ntpdate.


# Extra Stuff

Contents of chef-solo-prep.sh (just in case that script is unavailable for some odd reason):

    yum -y update
    mkdir /etc/chef /root/chef-solo
    wget -O /etc/chef/solo.rb https://gist.github.com/raw/847256/00429fd14daf0040bc7ea0cdf9ffd0fb06e8434e/chef-gitorious-etc-solo.rb
    echo "gem: --no-rdoc --no-ri" > /etc/gemrc
    yum install -y ruby ruby-devel libruby gcc-c++ make ssl-cert git
    cd /tmp
    wget http://production.cf.rubygems.org/rubygems/rubygems-1.4.2.tgz
    tar zxf rubygems-1.4.2.tgz
    ruby rubygems-1.4.2/setup.rb --no-format-executable
    gem install chef
    cd /root/chef-solo
    git clone git://github.com/makewhatis/gitorious-centos-6.git cookbooks
    cp /root/chef-solo/cookbooks/node.json /root/chef-solo/
    echo -e "\n-------------------------------------------------------- \\n
    Please review the settings in /root/chef-solo/node.json.\n
    You will have to change these in order to customize the install of this instance."

