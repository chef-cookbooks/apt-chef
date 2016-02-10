package 'chef-ha' do # should be a small package for fast install :)
  # we're all sad about this, but hey
  options '--force-yes' if platform?('ubuntu') && node['platform_version'] == '10.04'
end
