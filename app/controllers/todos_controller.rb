class TodosController < ApplicationController

    before_action :authorize!
    helper_method :todos

    def index
        @todo = Todo.new
    end

    def create
        @todo = Todo.new(todo_params)
        @todo.user = current_user

        if @todo.save
            redirect_to todos_url, notice: 'New todo added.'
        else
            render :index
        end
    end

    def update
        todo.update_attributes(todo_params)
        redirect_to todos_url, notice: 'You have updated the todo.'
    end

    def destroy
        todo.destroy
        redirect_to todos_url, notice: 'Todo was removed from the list'
    end

    protected

    def todo_params
        params.require(:todo).permit(:title, :is_completed)
    end

    def todo
        @todo ||= current_user.todos.find(params[:id])
    end

    def todos
        @todos ||= current_user.todos
    end

end
