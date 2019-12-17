class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end 

    def show
        @employee = Employee.find_by(id: params[:id])
    end 

    def new
        @employee = Employee.new

        @errors = flash[:errors]
    end

    def create

        employee_params = params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
        @employee = Employee.create(employee_params)

       if @employee.valid?

        flash[:success] = "Good job!"

        redirect_to employees_path

       else

        flash[:errors] = @employee.errors.full_messages

        redirect_to new_employee_path
       end
    end

    def edit
        @employee = Employee.find_by(id: params[:id])
    end

    def update
        @employee = Employee.find_by(id: params[:id])

        @employee.update(params.require(:employee).permit(:alias, :office, :dog_id))

        redirect_to employee_path(@employee)
    end
end
