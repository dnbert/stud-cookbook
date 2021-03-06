#
# Author:: Brett Gailey <brett.gailey@dreamhost.com>
# Cookbook Name:: stud
# Recipe:: default
#
# Copyright 2011, DreamHost.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe "apt"

apt_repository "ndn" do
	uri "https://debian.di.newdream.net"
	distribution node['lsb']['codename']
	components ['ndn']
	key "http://debian.di.newdream.net/packages@debian.newdream.net.gpg.key"
	action :add
end

package "stud" do
	action [:install]
end


service "stud" do
	supports :restart => true
	action [:start]
end

template "/etc/stud/stud.ipv4.conf"
	source	"stud.ipv4.conf.erb"
	owner	"root"
	group	"root"
	mode	"0644"
	notifies  :restart, service[stud]
end

template "/etc/stud/stud.ipv6.conf"
        source          "stud.ipv6.conf.erb"
        owner           "root"
        group           "root"
        mode            "0644"
        notifies        :restart, service[stud]
end
