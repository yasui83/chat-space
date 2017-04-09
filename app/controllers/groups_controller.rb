class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.valid? == true
      redirect_to(root_path)
    else
      flash[:alert] = "グループ名を入力してください"
      redirect_to(new_group_path)
    end

  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to(root_path)
  end

  private

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

end
