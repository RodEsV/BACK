class CartsController < ApplicationController
  before_action :authenticate_user! #Check if user authenticated to access his cart

end
