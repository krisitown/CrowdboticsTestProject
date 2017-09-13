class PhrasesController < ApplicationController
    def get_random
        @phrase = Phrase.order("RANDOM()").first
        render :json => @phrase
    end
    
    def new
        @phrase = Phrase.new
    end
    
    def create
        @phrase = Phrase.create(phrase_params)
        if @phrase.save
            flash[:success] = "Successfully added phrase."
            redirect_to root_url
        else
            flash.now[:danger] = "Phrase cannot be empty"
            render 'new'
        end
    end
    
    private
    
        def phrase_params
            params.require(:phrase).permit(:content)
        end
end
