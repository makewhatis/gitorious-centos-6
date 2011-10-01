execute("ntpdate"){ action :nothing }
package("ntpdate"){ notifies :run, "execute[ntpdate]" }
