require 'test_helper'

class RegistrationsHelperTest < ActionView::TestCase
	test "baseball_divisions" do
		#puts baseball_divisions.inspect
		assert_instance_of(Array, baseball_divisions)
		assert_equal(4, baseball_divisions.size)
		assert_instance_of(Array, baseball_divisions[0])
		assert_match(/5\/1\/2010 - 4\/30\/2012/, baseball_divisions[0][0])
		assert_match(/5\/1\/2008 - 4\/30\/2010/, baseball_divisions[1][0])
		assert_match(/5\/1\/2006 - 4\/30\/2008/, baseball_divisions[2][0])
		assert_match(/5\/1\/2004 - 4\/30\/2006/, baseball_divisions[3][0])
	end
end
