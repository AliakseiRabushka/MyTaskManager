class TasksController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @task = @board.tasks.create(task_params)
    redirect_to board_path(@board)
  end

  private

  def task_params
    params.require(:task).permit(:title_task, :body, :status)
  end
end
