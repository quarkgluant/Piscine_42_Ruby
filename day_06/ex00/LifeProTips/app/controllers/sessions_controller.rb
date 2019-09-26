class SessionsController < ApplicationController
  # ----- add these lines here: -----

  def new
    # No need for anything in here, we are just going to render our
    # new.html.erb AKA the login page
    render :login
  end

  def create
    # Look up User in db by the email address submitted to the login form and
    # convert to lowercase to match email in db in case they had caps lock on:
    user = User.find_by(email: params[:login][:pseudo].downcase) ||
           User.find_by(name: params[:login][:pseudo].downcase)

    # Verify user exists in db and run has_secure_password's .authenticate()
    # method to see if the password submitted on the login form was correct:
    if user && user.authenticate(params[:login][:password])
      # Save the user.id in that user's session cookie:
      session[:user_id] = user.id.to_s
      redirect_to root_path, notice: 'vous êtes connecté !'
    else
      # if email or password incorrect, re-render login page:
      # flash.now.alert = 'Perdu ! Email ou mot de passe incorrect, un nouvel esssai ?'
      redirect_to root_path, alert: 'Perdu ! Email ou mot de passe incorrect, un nouvel esssai ?'
    end
  end

  def destroy
    # delete the saved user_id key/value from the cookie:
    session.delete(:user_id)
    redirect_to root_path, notice: 'Déconnecté!'
  end

  # ----- end of added lines -----
end
