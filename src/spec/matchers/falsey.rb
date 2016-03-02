# mrusty. mruby safe bindings for Rust
# Copyright (C) 2016  Dragoș Tiselice
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# A matcher useful for testing falsey values.
#
# it 'knows a lie when it sees it' do
#   expect(false).to be_falsey
#   expect(nil).to be_falsey
# end
class FalseyMatcher
  def initialize(_name)
  end

  def match(subject)
    fail AssertError, "#{subject} is not falsey" if subject
  end

  def match_not(subject)
    @negative = true

    fail AssertError, "#{subject} is falsey" unless subject
  end

  def describe
    if @negative
      'to not be falsey'
    else
      'to be falsey'
    end
  end

  def self.match(method)
    method == :be_falsey
  end
end
