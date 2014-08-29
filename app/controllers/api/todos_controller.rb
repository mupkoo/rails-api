module Api
    class TodosController < BaseController

        before_action :authorize!

        def index
            render json: current_user.todos
        end

        def show
            render json: current_user.todos.find(params[:id])
        end

        def create
            todo = Todo.new(todo_params)
            todo.user = current_user

            if todo.save
                render json: todo
            else
                render json: { errors: todo.errors.try(:full_messages) }, status: 422
            end
        end

        def update
            todo = current_user.todos.find(params[:id])

            if todo.update_attributes(todo_params)
                render json: todo
            else
                render json: { errors: todo.errors.try(:full_messages) }, status: 422
            end
        end

        def destroy
            todo = current_user.todos.find(params[:id])
            todo.destroy

            render json: { success: true }
        end

        protected

        def todo_params
            params.require(:todo).permit(:title, :is_completed)
        end

    end
end
