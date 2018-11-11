class Api::V1::ProgonoriesController < ApplicationController
    before_action :restrict_access
    #http_basic_authenticate_with name:"admin",password: "secret"
    def index 
      @products = Product.all
      render json: @products
    end
    private 
    def restrict_access
      api_key = ApiKey.find_by_access_token(params[:access_token])
      head :unauthorized unless api_key
    end
end
