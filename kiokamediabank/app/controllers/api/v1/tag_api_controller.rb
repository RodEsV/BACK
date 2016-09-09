class Api::V1::TagsApiController < ApplicationController
  respond_to :json
  before_action :isAdmin,only:[:create,:update:destroy]
  before_action :tags_params
end
