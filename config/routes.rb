EnjuTrunkIll::Engine.routes.draw do
end

Rails.application.routes.draw do
  resources :inter_library_loans do
    post :export_loan_lists, :on => :collection
    post :get_loan_lists, :on => :collection
    post :pickup, :on => :collection
    post :pickup_item, :on => :collection
    post :accept, :on => :collection
    get :accept_item, :on => :collection
    get :download_file, :on => :collection
    post :output, :on => :member
  end

  resources :items do
    resources :inter_library_loans
  end
end
