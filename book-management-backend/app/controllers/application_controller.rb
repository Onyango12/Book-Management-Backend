class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  # GET /books
  get '/books' do
    books = Books.all
    books.to_json
  end

  # GET /books/:id
  get '/books/:id' do
    book = Books.find(params[:id])
    book.to_json
  end

  # POST /books
  post '/books' do
    data = JSON.parse(request.body.read)
    book = Books.new(data)
    
    if book.save
      status 201
      book.to_json
    else
      status 400
      { error: 'Failed to create the book.' }.to_json
    end
  end

  # PUT /books/:id
  put '/books/:id' do
    data = JSON.parse(request.body.read)
    book = Books.find(params[:id])
    
    if book.update(data)
      book.to_json
    else
      status 400
      { error: 'Failed to update the book.' }.to_json
    end
  end

  # DELETE /books/:id
  delete '/books/:id' do
    book = Books.find(params[:id])
    
    if book.destroy
      status 204
    else
      status 400
      { error: 'Failed to delete the book.' }.to_json
    end
  end



  # GET users
  get"/users" do
    users = User.all
    users.to_json
 end


#  POST users
  post "/users/adduser" do
    name=params[:name]
    email=params[:email]
    password=params[:password]


    if(name.present? &&  email.present? && password.present?)
        
    check_name = User.exists?(name: name)
    check_email = User.exists?(email: email)

    puts check_name
    if check_name==true
            status 406
            message = {:error=> "name exists in our database"}
            message.to_json()
    
    elsif check_email
            status 406
            message = {:error=> "Email exists in our database"}
            message.to_json()
    else
                user = User.create(name: name, email: email, password: password)
                if user
                    message = {:success=> "User has been created successfully"}
                    message.to_json()
                else
                    message = {:error=> "Error saving the user"}
                    message.to_json()
                end
        end
    
    else
        status 406
        message = {:error=> "All values are required"}
        message.to_json()
    end
  end

  # CURRENT USER
  get "/current_user" do
    user = User.find_by(id: session[:user_id])
    
    if user
        {:currentUser => user}.to_json
    else
            message = {:error=> "Not logged in"}
            message.to_json
    end
    
    end
    # GET rating 
    get "/ratings" do
      ratings = Ratings.all
      ratings.to_json(include: :user)
   end

   # ADD RATING
   post "/ratings/addrating" do
    rating=params[:rating]
    user_id=params[:user_id]
    post_id=params[:post_id]
   
    if(rating.present? &&  post_id.present? && user_id.present?)

        check_user = User.exists?(id: user_id)
        check_post = Post.exists?(id: post_id)
        if check_user===false
            status 406
            message = {:error=> "User trying to add book does not exist!"}
            message.to_json
        elsif check_post===false
            status 406
            message = {:error=> "The book you are trying to rate doesnt exist!"}
            message.to_json
        else
            rating = Ratings.create(rating: rating, post_id: post_id, user_id: user_id)
            if rating
                message = {:success=> "Ratings made successfully"}
                message.to_json
            else
                status 406
                message = {:error=> "Error on saving rating"}
                message.to_json
            end

        end
    end
end    

end
