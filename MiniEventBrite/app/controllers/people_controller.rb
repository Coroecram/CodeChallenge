class PeopleController < ApplicationController
  def new
    @person = Person.new
    render :new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to person_url(@person.person_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @person = Person.find(params[:id])

    render :edit
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to person_url(@person.person_id)
    else
      render :edit
    end
  end

  def destroy
    @person = Person.find(params[:id])
    Person.destroy(@person)

    redirect_to root_url
  end

  private
  def person_params
    params.require(:person).permit(:firstname, :lastname)
  end
end
