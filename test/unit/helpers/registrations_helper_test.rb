require 'test_helper'

class RegistrationsHelperTest < ActionView::TestCase
	test "baseball_divisions" do
		#puts baseball_divisions.inspect
		assert_instance_of(Array, baseball_divisions)
		assert_equal(5, baseball_divisions.size)
		assert_instance_of(Array, baseball_divisions[0])
		assert_match(/5\/1\/2009 - 4\/30\/2011/, baseball_divisions[0][0])
		assert_match(/5\/1\/2007 - 4\/30\/2009/, baseball_divisions[1][0])
		assert_match(/5\/1\/2005 - 4\/30\/2007/, baseball_divisions[2][0])
		assert_match(/5\/1\/2003 - 4\/30\/2005/, baseball_divisions[3][0])
		assert_match(/5\/1\/2001 - 4\/30\/2003/, baseball_divisions[4][0])
		assert_match(/\*\* depending on interest \*\*/, baseball_divisions[4][0])
	end
end
