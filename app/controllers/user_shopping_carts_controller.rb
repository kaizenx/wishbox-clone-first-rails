class UserShoppingCartsController < ApplicationController
  
  before_action :set_user_shopping_cart, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # hide every item in the shopping cart
  def clearcart
    usershoppingcart = UserShoppingCart.where(userid:current_user.id, isshow:true)
    usershoppingcart.each do |e|
      e.isshow = false
      e.save
    end
    redirect_to "/user_shopping_carts/empty"
  end

  #remove one item from the shopping cart
  def remove
    usershoppingcartitemid = params[:id]
    usershoppingcart = UserShoppingCart.find(usershoppingcartitemid)
    usershoppingcart.isshow = false
    usershoppingcart.save
    # remove from itinerary
    itinerary = Itinerary.where(:TripId=>usershoppingcart.TripId, :ProductId => usershoppingcart.productid ).take
    if itinerary != nil
      itinerary.destroy
    end
    redirect_to "/user_shopping_carts/cart"
  end

  #increase number of items bought
  def change_quantity
    new_quantity = params[:Quantity]
    user_shopping_cart_id = params[:Id]
    usershoppingcart = UserShoppingCart.find(user_shopping_cart_id)
    usershoppingcart.Quantity = new_quantity
    usershoppingcart.save
  end
 
  #empty page
  def empty
  end

  #buy an item
  def buy
    #make the order
    #get the id of the order you just made
    order = Order.new( UserId: current_user.id )
    order.save
    order_id = order.id
    session[:order_id] = order_id
    usershoppingcart = UserShoppingCart.where(userid:current_user.id, isshow:true)
    total_price = 0.0
    usershoppingcart.each do |e|
      e.OrderId = order_id
      # e.isshow = false
      # e.save
      total_price = total_price + e.Price
    end
    session[:total_price] = total_price
    auth = {:username => "AbIu-BCengrIB1V34JbwySJR4brPKJG8i8HvcjcZhU6mcjwyW_heXPg1yXR1", :password => "EOK6sxA9InT71Of6ghPGyHp87Ly3QfZPTieW1w7jR04O3gn8pZ6z6ljpzt5F"}
    headers = {"Accept" => 'application/json', "Accept-Language"=> 'en_US'}
    response = HTTParty.post(
      'https://api.sandbox.paypal.com/v1/oauth2/token',
      :headers => headers,
      :body => {"grant_type" => "client_credentials"},
      :basic_auth => auth


      )
    parsed_json = ActiveSupport::JSON.decode(response.body)
    # puts response.body#, response.code, response.message, response.headers.inspect
    access_token = parsed_json['access_token']
    # parsed_json.each do |key, value|
    #   if key == "access_token"
    #     access_token = value
    #   end
    #   # p "#{key} => #{value}"
    # end
    session[:wishbox] = access_token

    return_url = "#{request.protocol}#{request.host_with_port}/user_shopping_carts/receive"
    cancel_url = "#{request.protocol}#{request.host_with_port}/user_shopping_carts/cancel"

    bearer_access_token = 'Bearer {accessToken}'
    bearer_access_token["{accessToken}"]= access_token
    total_price = Money.new(total_price*100)
    headers = {'Content-Type' => 'application/json', 'Authorization' => bearer_access_token }
    http_body = {
      :intent => 'sale',
      :redirect_urls => {
        :return_url => return_url,
        :cancel_url => cancel_url
       },
      :payer => {
        :payment_method => 'paypal'
      },
      :transactions => [
        {
          :amount => {
            :total => total_price.to_s,
            :currency => 'USD'
          },
          :description => "Thank you for your order, you have been charged USD " + total_price.to_s
        }
      ]

    }

    response = HTTParty.post(
      'https://api.sandbox.paypal.com/v1/payments/payment',
      :headers => headers,
      :body => http_body.to_json
      )
    parsed_json = ActiveSupport::JSON.decode(response.body)
    # puts response.body#, response.code, response.message, response.headers.inspect
    approval_url = parsed_json['links'][1]['href']
    payment_id = parsed_json['id']
    gateway_price = parse_json['transactions']['amount']['total']
    gateway_currency = parse_json['transactions']['amount']['currency']
    session[:wishable] = payment_id
    session[:gatewayprice] = gateway_price
    session[:gatewaycurrency] = gateway_currency
    # puts response.body#, response.code, response.message, response.headers.inspect
    redirect_to approval_url
  end

  #thank you page
  def receive
    payer_id = params[:PayerID]
    access_token = session[:wishbox]
    payment_id = session[:wishable]
    total_price = session[:total_price]
    gateway_price = session[:gatewayprice]
    gateway_currency = session[:gatewaycurrency]

    bearer_access_token = 'Bearer {accessToken}'
    bearer_access_token["{accessToken}"]= access_token
    post_url = 'https://api.sandbox.paypal.com/v1/payments/payment/'+payment_id+'/execute/'
    headers = {'Content-Type' => 'application/json', 'Authorization' => bearer_access_token }
    http_body = { :payer_id => payer_id }
    response = HTTParty.post(
      post_url,
      :headers => headers,
      :body => http_body.to_json
      )
    # we have to record that the user has paid us for a certain order
    Order.update(session[:order_id], {:PaymentId => payment_id, 
                                      :PayerId => payer_id, 
                                      :Amount => total_price,
                                      :GateWayPrice => gateway_price,
                                      :GateWayCurrency => gateway_currency }

                )
    

    redirect_to "/user_shopping_carts/thankyou"
    
    # do active merchant stuff here
  end

  def thankyou
    @thankyou = "Thank you for shopping with us"
  end

  def cancel
    
  end

  #display shopping cart page
  def cart

    trips = Trip.where(:userid => current_user.id)  
    trips_tokenized = trips.map(&:id)

    user_shopping_cart = UserShoppingCart.where( TripId:trips_tokenized ,userid:current_user.id, isshow:true, IsBought:false)  
     
    if user_shopping_cart.count > 0
      # product_tokenized = product_id_list.map(&:productid)
      # @products_list = Product.readonly.where(id:product_tokenized).order("id desc")
      @products_list = Array.new
      user_shopping_cart.each do | el |
        product_record = Product.find(el.productid)
        trip = Trip.find(el.TripId)
        feed = Feed.find(trip.feedid)
        startdate = trip.StartDate
        enddate = trip.EndDate

        start_date = startdate.strftime("%d-%m-%Y")
        end_date = enddate.strftime("%d-%m-%Y")

        cart_item = { :id => el.id,
                      :productid => product_record.id,
                      :image => product_record.ImageURL,
                      :Title => product_record.Title,
                      :Quantity => el.Quantity,
                      :Price => el.Price,
                      :FeedTitle => feed.Title,
                      :TripStart => start_date,
                      :TripEnd => end_date

        }
        @products_list.push(cart_item)
      end
    else
      redirect_to "/user_shopping_carts/empty"
    end
    
  end
  # GET /user_shopping_carts
  # GET /user_shopping_carts.json
  def index
    @user_shopping_carts = UserShoppingCart.all
  end

  # GET /user_shopping_carts/1
  # GET /user_shopping_carts/1.json
  def show
  end

  # GET /user_shopping_carts/new
  def new
    @user_shopping_cart = UserShoppingCart.new
  end

  # GET /user_shopping_carts/1/edit
  def edit
  end

  # POST /user_shopping_carts
  # POST /user_shopping_carts.json
  def create
    @user_shopping_cart = UserShoppingCart.new(user_shopping_cart_params)

    respond_to do |format|
      if @user_shopping_cart.save
        format.html { redirect_to @user_shopping_cart, notice: 'User shopping cart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_shopping_cart }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_shopping_carts/1
  # PATCH/PUT /user_shopping_carts/1.json
  def update
    respond_to do |format|
      if @user_shopping_cart.update(user_shopping_cart_params)
        format.html { redirect_to @user_shopping_cart, notice: 'User shopping cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_shopping_carts/1
  # DELETE /user_shopping_carts/1.json
  def destroy
    @user_shopping_cart.destroy
    respond_to do |format|
      format.html { redirect_to user_shopping_carts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_shopping_cart
      @user_shopping_cart = UserShoppingCart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_shopping_cart_params
      params.require(:user_shopping_cart).permit(:userid, :productid, :isshow, :isbought, :Title, :Price, :VoucherCode, :Quantity, :OrderId, :TripId)
    end
end
