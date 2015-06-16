#
# Author:: Joshua Timberman <joshua@chef.io>
# Copyright (c) 2015, Chef Software, Inc. <legal@chef.io>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.default['apt-chef'].tap do |apt|
  # Set the repository name, must be a string.
  apt['repo_name']           = 'chef-stable'

  # The base URI for the repository, must be a string
  apt['uri']                 = 'https://packagecloud.io/chef/stable/ubuntu/'

  # Location for the GPG key used to sign the repository
  apt['key']                 = 'https://packagecloud.io/gpg.key'

  # A list of codenames that are supported for the repository. These
  # are the Ubuntu LTS releases by default, because this is primarily
  # used for the Chef Server packages. However, this list can be
  # modified if an alternative package repository is used and other
  # codenames are present. The packages generally "work" forward
  # compatible. https://docs.chef.io/supported_platforms.html
  apt['supported_codenames'] = %w(lucid precise trusty)

  # A YOLO fallback so we don't fail to install packages, but use at
  # one's own risk. The supported Ubuntu platforms are the LTS release
  # (see above).
  apt['codename']            = if node.attribute?('lsb') && node['lsb'].attribute?('codename') &&
                                  node['apt-chef']['supported_codenames'].include?(node['lsb']['codename'])
                                 node['lsb']['codename']
                               else
                                 'lucid' # fall back to lucid, and hope for the best
                               end
end
