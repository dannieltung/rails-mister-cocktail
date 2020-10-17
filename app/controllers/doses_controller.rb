class DosesController < ApplicationController
  def new
    # vc não precisa de um find ingredient pois vc vai criar a dose referenciando primeiro
    # o cocktail...e vai pegar o ingredient através do association no simple_form.
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'Dose created!'
    else
      render :new
      # render "cocktails/show"
      # na linha acima, você vai enviar para a show da cocktails caso dê errado.
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    # redirect_to cocktail_path(@review.restaurant), notice: 'Review deleted.'
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
    # os campos permit você precisa verificar a nomenclatura que esta vindo dos params
    # e NAO das instancias criadas no model.
    # vc não precisa permitir o cocktail_id porque a DOSE já esta sendo criada DENTRO da cocktail.
  end
end
