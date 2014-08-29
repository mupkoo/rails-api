module Api
    class TodosController < BaseController

        def index
            render json: Todo.all
        end

        def show
            render json: Todo.find(params[:id])
        end

        def create
            todo = Todo.new(todo_params)

            if todo.save
                render json: todo
            else
                render json: { errors: todo.errors.try(:full_messages) }, status: 422
            end
        end

        def update
            todo = Todo.find(params[:id])

            if todo.update_attributes(todo_params)
                render json: todo
            else
                render json: { errors: todo.errors.try(:full_messages) }, status: 422
            end
        end

        def destroy
            todo = Todo.find(params[:id])
            todo.destroy

            render json: { success: true }
        end

        protected

        def todo_params
            params.require(:todo).permit(:title, :is_completed)
        end

    end
end
