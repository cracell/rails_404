require "#{File.dirname(__FILE__)}/test_helper"

class RoutingTest < Test::Unit::TestCase 
  def setup 
    ActionController::Routing::Routes.draw do |map| 
      map.connet 'pregenerate/:id', :controller => 'pregenerate_controller', :action => 'show' 
    end  
  end  
  
  def test_rails_404_route
    assert_recognition :get, "/pregenerate", :controller => "pregenerate", :action => "show"  
  end  
private 
  def assert_recognition(method, path, options)  
    result = ActionController::Routing::Routes.recognize_path(path, :method => method)  
    assert_equal options, result 
  end 
end 