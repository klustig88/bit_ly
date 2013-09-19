LETTERS = ("A".."Z").to_a + (1..9).to_a.map! {|x| x.to_s}

get '/' do
  erb :index
end

post '/urls' do
  short = ''
  6.times { short << LETTERS[rand(1..36)] }
  Url.create(norm_url: params[:url], short_url: "kev.ja#{short}")
  redirect to ('/')
end

get '/:short_url' do
  p @go_to = Url.find_by_short_url(params[:short_url].norm_url)
  

end
