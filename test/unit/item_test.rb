require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "should not save Item without name" do
    item = Item.new(:description => '6 disc box-set', :user_id => 1)
    assert !item.save, "Saved the Item without name"
  end
end
