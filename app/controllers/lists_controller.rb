class ListsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のmoduleオブジェクトを生成する
    @list = List.new
  end

  def create
    #データを受け取り新規登録するためのインスタンスを作成
    list = List.new(list_params)
    #データをデータベースに保存するためのsaveメソッド実行
    list.save
    #トップ画面へリダイレクト
    redirect_to '/top'
  end

  def index #一覧画面用のアクション
    @lists = List.all
  end

  def show
  end

  def edit
  end

  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
