class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_url
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end

  def weixin
    uri = URI("https://api.weixin.qq.com/sns/userinfo?access_token=#{params[:code]}&openid=#{params[:openid]}&lang=zh_CN")
    res = Net::HTTP.get_response(uri)
    json =  JSON.parse(res.body.gsub(/[\u0000-\u001f]+/, ''))
    user = User.create(
      openid: json["openid"],
      name: Rumoji.encode(json["nickname"])
    redirect_to root_url
  end
  
  private
   def user_params
    params.require(:user).permit(:openid, :cell, :name)
   end
end