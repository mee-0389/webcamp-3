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
    #詳細画面へリダイレクト
    redirect_to list_path(list.id)
  end

  def index #一覧画面用のアクション
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
    #更新後にリダイレクトし、変更をviewファイルに渡す必要がないのでローカル変数
  end

  def destroy
    list = List.find(params[:id]) #データ(レコード)を一件取得
    list.destroy #データ(レコード)を削除
    redirect_to '/lists' #投稿一覧画面へリダイレクト
  end

  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
