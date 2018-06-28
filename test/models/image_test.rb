require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_url_valid
    image = Image.new(link: 'https://i.ytimg.com/vi/SfLV8hD7zX4/maxresdefault.jpg')

    assert_predicate image, :valid?
  end

  def test_url_invalid
    image = Image.new(link: 'djusdhclkds')

    refute_predicate image, :valid?
    assert_equal 'is invalid', image.errors.messages[:link].first
  end

  def test_invalid_if_url_is_blank
    image = Image.new(link: '')

    assert_predicate image, :invalid?
    assert_equal "can't be blank", image.errors.messages[:link].first
  end
end
