module Admin
  class QaItemsController < ApplicationController
    include AdminAuthenticatable
    layout "admin"

    before_action :set_qa_item, only: %i[edit update destroy]

    def index
      @qa_items = QaItem.ordered
    end

    def new
      @qa_item = QaItem.new
    end

    def create
      @qa_item = QaItem.new(qa_item_params)
      if @qa_item.save
        redirect_to admin_qa_items_path, notice: "Q&Aを作成しました"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @qa_item.update(qa_item_params)
        redirect_to admin_qa_items_path, notice: "Q&Aを更新しました"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @qa_item.destroy
      redirect_to admin_qa_items_path, notice: "Q&Aを削除しました"
    end

    private

    def set_qa_item
      @qa_item = QaItem.find(params[:id])
    end

    def qa_item_params
      params.require(:qa_item).permit(:question, :answer, :position)
    end
  end
end
