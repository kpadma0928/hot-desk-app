Rails.application.routes.draw do
  
  resources :seats
  resources :sears
  	root to: 'visitors#index'
     get "/change_locale" => "i18n#change_locale", :as => :change_locale
  locale_regex_string = HotDesk::AVAILABLE_LOCALES.map { |l| l[:ident] }.concat(HotDesk::REMOVED_LOCALES.to_a).join("|")
  locale_matcher = Regexp.new(locale_regex_string)
  scope "(/:locale)", :constraints => { :locale => locale_matcher } do
  	devise_for :users
  	resources :users
  	resources :seats
  	get '/book_seat' => "users#book_seat"
  	put '/assign_seat' => "users#assign_seat"
  end	 	
end
