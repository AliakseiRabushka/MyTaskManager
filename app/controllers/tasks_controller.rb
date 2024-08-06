class TasksController < ApplicationController
  def index
    @board = Board.find(params[:board_id])
    @tasks = @board.tasks
  end

  def show
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:id])
  end

  def new
    @board = Board.find(params[:board_id])
    @task = Task.new
    @users = User.all
  end

  def create
    @board = Board.find(params[:board_id])
    @task = @board.tasks.create(task_params)
    @user = User.find_by(nickname: task_params[:nickname])
    redirect_to board_path(@board)
  end

  def edit
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:id])
    @users = User.all
  end

  def update
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to @board
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @task = Board.find(params[:board_id]).tasks.find(params[:id])
    @task.destroy

    redirect_to @board, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title_task, :body, :status, :nickname)
  end
end
