#
# Cookbook:: cookbook-nagios_client
# Recipe:: linux
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# if platform?('redhat')
case node['platform']
when 'redhat'
  # Red Hat settings differ by release now
  case node['platform_version'].to_i
  when 5
    # RHEL 5 settings
    rpm_source = 'https://repo.nagios.com/nagios/5/nagios-repo-5-2.el5.noarch.rpm'
  when 6
    # RHEL 6 settings
    rpm_source = 'https://repo.nagios.com/nagios/6/nagios-repo-6-4.el6.noarch.rpm'
  when 7
    # RHEL 7 settings
    rpm_source = 'http://repo.nagios.com/nagios/7/nagios-repo-7-4.el7.noarch.rpm'
  end
end

# Install Nagios Yum Repo
rpm_package 'nagios_repo' do
  source rpm_source
end

package 'ncpa'

replace_or_add 'community_string' do
  path node['nagios']['config_file']
  pattern 'community_string = *'
  line "community_string = #{node['nagios']['community_string']}"
  notifies :restart, 'service[ncpa_listener]'
  notifies :restart, 'service[ncpa_passive]'
end

service 'ncpa_listener' do
  action :start
end

service 'ncpa_passive' do
  action :start
end
