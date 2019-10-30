name 'apt-chef'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description 'Configures apt repository for Chef Software, Inc. products'
version '3.0.0'

supports 'ubuntu'

source_url 'https://github.com/chef-cookbooks/apt-chef'
issues_url 'https://github.com/chef-cookbooks/apt-chef/issues'
chef_version '>= 12.9' if respond_to?(:chef_version)
