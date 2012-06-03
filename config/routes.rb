Diff::Application.routes.draw do
  root :to => "home#index"
  get '/diff' => "diffs#diff"
end
