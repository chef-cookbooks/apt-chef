require 'spec_helper'

describe 'apt-chef::default' do
  context 'ubuntu-18.04' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(
        platform: 'ubuntu',
        version: '18.04'
      ).converge(described_recipe)
    end

    it 'renders the apt repository with defaults' do
      expect(chef_run).to add_apt_repository('chef-stable').with(
        repo_name: 'chef-stable',
        uri: 'https://packages.chef.io/stable-apt',
        key: ['https://downloads.chef.io/packages-chef-io-public.key'],
        distribution: 'lucid'
      )
    end
  end
end
