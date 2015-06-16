require 'spec_helper'

describe 'apt-chef::default' do
  context 'cookbook attributes are set, on an unspecified platform' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.set['apt-chef'].tap do |apt|
          apt['repo_name'] = 'chef-nightly'
          apt['uri'] = 'https://example.com/chef/nightly/ubuntu'
          apt['key'] = 'https://example.com/package-public.key'
        end
      end.converge(described_recipe)
    end

    it 'renders the apt repository from attributes' do
      expect(chef_run).to add_apt_repository('chef-nightly').with(
        repo_name: 'chef-nightly',
        uri: 'https://example.com/chef/nightly/ubuntu',
        key: 'https://example.com/package-public.key',
        distribution: 'lucid'
      )
    end
  end

  context 'ubuntu-14.04' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(
        platform: 'ubuntu',
        version: '14.04'
      ).converge(described_recipe)
    end

    it 'renders the apt repository with defaults' do
      expect(chef_run).to add_apt_repository('chef-stable').with(
        repo_name: 'chef-stable',
        uri: 'https://packagecloud.io/chef/stable/ubuntu/',
        key: 'https://packagecloud.io/gpg.key',
        distribution: 'trusty'
      )
    end
  end
end
