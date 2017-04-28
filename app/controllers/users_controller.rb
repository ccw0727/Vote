class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new  #宣告一個新的User物件
  end

  # GET /users/1/edit
  def edit  #這個方法是取得編輯的資料
  end

  # POST /users
  # POST /users.json
  def create  
    @user = User.new(user_params)  #定義新增方法，其中只會傳入被清洗過的欄位

    respond_to do |format|
      if @user.save 
        format.html { redirect_to @user, notice: 'User was successfully created.' }  #若產生新的檔儲存成功，會有提示字'User was successfully created.'
        format.json { render :show, status: :created, location: @user }  #並會導向show方法,狀態為'已新增',儲存在@user實例變數裡
      else
        format.html { render :new }  #若產生新的檔儲存失敗,導向new方法
        format.json { render json: @user.errors, status: :unprocessable_entity }  #導向失敗的回傳
      end
    end
  end
  
  
  
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)  
        format.html { redirect_to @user, notice: 'User was successfully updated.' }  #若檔案更新成功，會有提示字'User was successfully updated.'
        format.json { render :show, status: :ok, location: @user }  #並會導向show方法,狀態為'ok',儲存在@user實例變數裡
      else
        format.html { render :edit }  #若檔案更新失敗，導向edit方法
        format.json { render json: @user.errors, status: :unprocessable_entity }  #導向失敗的回傳
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params  #清洗欄位，只允許name,email,password三個欄位被傳入
      params.require(:user).permit(:name, :email, :password)
    end
end
