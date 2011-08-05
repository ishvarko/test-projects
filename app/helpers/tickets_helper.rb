module TicketsHelper
  def get_status_by_id(id)
    if id
      Status.find(id).name
    else
      return " - "
    end
  end
  def get_owner_by_id(id)
    if id
      User.find(id).name
    else
      return " - "
    end
  end
  def get_department_by_id(id)
    if id
    Department.find(id).name
    else
      return " - "
    end
  end
  def departments_select_field
    @departments = Department.find(:all)
    collection_select(:ticket, :department, @departments, :id, :name, :class => "status") 
  end
end
