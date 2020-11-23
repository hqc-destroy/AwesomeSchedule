class DemoScreenController < ApplicationController
  def sign_up
    render "./sign_up"
  end

  def sign_in
    render "./sign_in"
  end
end
