name 'apt-chef'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Configures apt repository for Chef Software, Inc. products'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.1'
depends 'apt'
supports 'ubuntu'

source_url 'https://github.com/chef-cookbooks/apt-chef' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/apt-chef/issues' if respond_to?(:issues_url)
