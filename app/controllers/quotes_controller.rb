class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong>. The quote needs to be between 3 and 140 characters'
    end
    redirect_to root_path
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

end
