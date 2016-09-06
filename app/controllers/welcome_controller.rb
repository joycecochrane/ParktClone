class WelcomeController < ApplicationController
  def index
    if (!current_user)
      redirect_to "/welcome/login"
    end
  end
  
  def aboutUs
  end
  
  def root
    index
  end
  
  def login
    if current_user
      redirect_to "/welcome"
    end
  end
end
