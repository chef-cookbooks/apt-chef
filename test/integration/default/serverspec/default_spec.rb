require 'spec_helper'

describe 'apt-chef::default' do
  it 'has the chef-stable repository created' do
    expect(file('/etc/apt/sources.list.d/chef-stable.list')).to be_file
  end

  it 'has the chef-ha package installed' do
    expect(package('chef-ha')).to be_installed
  end
end
