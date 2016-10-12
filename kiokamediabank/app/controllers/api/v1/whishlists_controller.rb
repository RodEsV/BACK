class Api::V1::WhishlistsController < ApplicationController
  respond_to :json
  before_action :set_whishlist, only: [:show, :edit, :update, :destroy, :add, :remove]

  # before_action :isAdmin, only:[:create,:update,:destroy]

  # GET /roles
  # GET /roles.json
  def index
    respond_with Whishlist.all
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    respond_with Whishlist.find(params[:id])
  end

  # GET /roles/new
  def new
    @role = Whishlist.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    my_user = User.find_by_id(params[:user])
    @whishlist = Whishlist.new(user: my_user, updated_at: Time.now)
    @whishlist.save
    respond_with :api, :v1, @whishlist
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    if @whishlist.update(whishlist_params)
      render json: @whishlist
    else
      render json: @whishlist.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def add
    my_subproduct = Subproduct.find_by_id(params[:subproduct])
    if @whishlist.subproducts.include? my_subproduct
      init_whishlist_sub(@whishlist, my_subproduct)
      @whishlist_subproduct.increment(:quantity, 1)
    else
      init_whishlist_sub(@whishlist, my_subproduct)
      add_a_subproduct(my_subproduct)
      init_whishlist_sub(@whishlist, my_subproduct)
      @whishlist_subproduct.increment(:quantity, 1)
      # @whishlist_subproduct = whishlistsubproduct.create(quantity: 1, whishlist: @whishlist, subproduct: my_subproduct)
    end

    if @whishlist.save && @whishlist_subproduct.save
      render json: @whishlist
    else
      render json: @whishlist.errors, status: :unprocessable_entity
    end
  end

  def remove
    my_subproduct = Subproduct.find_by_id(params[:subproduct])
    if @whishlist.subproducts.include? my_subproduct
      init_whishlist_sub(@whishlist, my_subproduct)
      if @whishlist_subproduct.quantity >= 1
        @whishlist_subproduct.update_attribute(:quantity, @whishlist_subproduct.quantity - 1)
      else
        render json: @whishlist.errors, status: :unprocessable_entity
      end
    end

    if @whishlist.save && @whishlist_subproduct.save
      render json: @whishlist
    else
      render json: @whishlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @whishlist.destroy
    if @whishlist.errors.any?
      head :no_content
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_whishlist
      @whishlist = Whishlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def whishlist_params
      params.permit(:name)
    end

    def init_whishlist_sub(whishlist, subproduct)
      @whishlist_subproduct = WhishlistSubproduct.find_by(whishlist: whishlist, subproduct: subproduct)
    end

    def add_a_subproduct(subproduct)
      @whishlist.subproducts << subproduct
      if !@whishlist.save
        render json: @whishlist.errors, status: :unprocessable_entity
      end
    end
end
