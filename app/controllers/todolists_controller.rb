class TodolistsController < ApplicationController
  def new
  	# Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する
  	@list = List.new
  end

  def create
  	# ストロングパラメーターを使用
  	list = List.new(list_params)
  	list.save
   redirect_to "/todolists/#{list.id}"
  end

  def index
      @lists = List.all
  end

  def show
      @list = List.find(params[:id])
  end

  private

  def list_params
  	  params.require(:list).permit(:title, :body)
  end

end
