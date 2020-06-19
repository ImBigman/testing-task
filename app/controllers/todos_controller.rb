class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    create_todo(todo_params)
    if @todo.save
      render json: { status: 'Success', message: 'Saved todo', data: @todo }, status: :ok
    else
      head 405
    end
  end

  def update
    if todo.update(isCompleted: true)
      render json: { status: 'Success', message: "Todo##{@todo.id} was completed!", data: @todo }, status: :ok
    else
      head 405
    end
  end

  private

  def create_todo(todo_params)
    @project_params = todo_params[:project_id]
    @project = Project.find_by(id: @project_params)
    if @project.blank?
      @new_project = Project.new(title: @project_params)
      @todo = @new_project.todos.new(todo_params)
    else
      @todo = @project.todos.build(todo_params)
    end
  end

  def todo
    @todo = Todo.find(params[:id])
  end

  helper_method :todo

  def todo_params
    params.require(:todo).permit(:text, :project_id)
  end
end
