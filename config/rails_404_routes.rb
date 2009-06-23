ActionController::Routing::Routes.draw do |map|
  map.connect 'pregenerate/:id', :controller => 'pregenerate', :action => 'show'
end