require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_create_succeed
    assert_difference('Image.count', 1) do
      image_params = { link: 'https://i.ytimg.com/vi/SfLV8hD7zX4/maxresdefault.jpg' }
      post images_path, params: { image: image_params }
    end

    assert_redirected_to image_path(Image.last)
    assert_equal 'Image successfully saved!', flash[:success]
  end

  def test_create_fail
    assert_no_difference('Image.count') do
      image_params = { link: 'gadgasck' }
      post images_path, params: { image: image_params }
    end

    assert_response :unprocessable_entity
    assert_equal 'Invalid URL', flash[:danger]
  end

  def test_show_succeed
    image = Image.create!(link: 'https://i.ytimg.com/vi/SfLV8hD7zX4/maxresdefault.jpg')

    get image_path(image)
    assert_response :ok
    assert_select "img[src='#{image.link}']"
  end

  def test_show_fail
    Image.destroy_all
    get image_path(1)

    assert_response :unprocessable_entity
  end
end
