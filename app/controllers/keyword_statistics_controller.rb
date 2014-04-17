class KeywordStatisticsController < ApplicationController
  include ApplicationHelper

  def index
    @keywords = KeywordStatistic.collection.aggregate([
                                                          {'$group' => {
        '_id'=> {'keyword'=> '$keyword', 'portal'=> '$portal'},
        'matchedDocuments'=> {
        '$push'=>{
        'id'=> '$_id',
        'time'=> '$time',
        'num'=> '$num'
    }},
        'num'=> { '$sum'=> 1},
        'costs'=> { '$sum'=> '$costs'},
        'earnings'=> { '$sum'=> '$earnings'},
        'ci'=> { '$sum'=> '$ci'},
        'co'=> { '$sum'=> '$co'},
        'ctr'=> { '$avg'=> '$ctr'},
        'cpc'=> { '$avg'=> '$cpc'},
        'epc'=> { '$avg'=> '$epc'},
        'cpc_last'=> { '$last'=> '$cpc'},
    }},
        {'$match'=>{
        'ctr'=> {'$gte'=> 0.8},
        'earnings'=> {'$gte'=> 0.1},
        'ci' => {'$gte'=> 9.0}
    }},
        { '$sort' => { 'earnings' => -1, 'ctr'=> -1 } },
        { '$skip' => 0 },
        { '$limit' => 10 }
    ])

    respond_to do |format|
      format.json { render json: @keywords, status: :ok }
    end
  end

  def filter_keywords
    @keywords = KeywordStatistic.collection.aggregate([
                                                          {'$group' => {
                                                              '_id'=> {'keyword'=> '$keyword', 'portal'=> '$portal'},
                                                              'matchedDocuments'=> {
                                                                  '$push'=>{
                                                                      'id'=> '$_id',
                                                                      'time'=> '$time',
                                                                      'num'=> '$num'
                                                                  }},
                                                              'num'=> { '$sum'=> 1},
                                                              'costs'=> { '$sum'=> '$costs'},
                                                              'earnings'=> { '$sum'=> '$earnings'},
                                                              'ci'=> { '$sum'=> '$ci'},
                                                              'co'=> { '$sum'=> '$co'},
                                                              'ctr'=> { '$avg'=> '$ctr'},
                                                              'cpc'=> { '$avg'=> '$cpc'},
                                                              'epc'=> { '$avg'=> '$epc'},
                                                              'cpc_last'=> { '$last'=> '$cpc'},
                                                          }},
                                                          {'$limit' => Integer(params[:limit])},
                                                          {'$match'=> sanitize_params(params) },
                                                          { '$sort' => { 'earnings' => -1, 'ctr'=> -1 } },
                                                          { '$skip' => 0 }
                                                      ])

    respond_to do |format|
      format.json { render json: @keywords, status: :ok }
    end


  end



end
