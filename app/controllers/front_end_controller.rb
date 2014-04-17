class FrontEndController < ApplicationController

  def index
    operators
  end

  def select_boxes
    operators
  end



  private
    def operators
      @operators = []
      @operators << {name: '<=', value: '$lte'}
      @operators << {name: '>=', value: '$gte'}
    end

end