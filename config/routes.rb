Diff::Application.routes.draw do
  root :to => "home#index"
  post '/diff' => "diffs#diff"
end
