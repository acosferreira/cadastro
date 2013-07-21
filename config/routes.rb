ActionController::Routing::Routes.draw do |map|
 
  
 
  map.login '/admin/login', :controller => 'admin', :action => 'login'
  map.logout '/admin/logout', :controller => 'admin', :action => 'logout'

  map.root :controller=> "pessoas"
  map.resources :reports
  map.resources :aniversariantes
  
  map.resources :usuarios, :active_scaffold => true
  map.resources :pessoas, :active_scaffold => true
  map.resources :tipos, :active_scaffold => true
  map.resources :escolaridades, :active_scaffold => true
  map.resources :conjuges, :active_scaffold => true
  map.resources :filhos, :active_scaffold => true
  map.resources :reuniaos, :active_scaffold => true
  map.resources :pessoas_reuniaos, :active_scaffold => true
  map.resources :estadocivils, :active_scaffold => true
  map.resources :idiomas, :active_scaffold => true
  map.resources :create_newsletters, :collection =>{:deliver=>:get}
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  #  map.login '/admin/login', :controller => 'admin', :action => 'login'
  #  map.logout '/admin/logout', :controller => 'admin', :action => 'logout'
end
