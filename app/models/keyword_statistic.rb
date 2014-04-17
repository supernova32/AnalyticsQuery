class KeywordStatistic
  include Mongoid::Document
  include Mongoid::Timestamps

  #attr_accessible :id, :_id, :time, :keyword, :portal, :advertising_partner, :ci, :co, :ctr, :costs, :costs_without_clickouts, :earnings, :profit, :cpc, :epc, :per_advp, :advertising_partners, :ci_ids, :clickins, :click_type

  #field :_id, type: String

  field :time, type: DateTime
  field :keyword, type: String
  field :portal, type: String

  field :ci, type:Float
  field :co, type:Float
  field :ctr, type:Float
  field :costs, type:Float
  field :costs_without_clickouts, type:Float
  field :earnings, type:Float
  field :profit, type:Float
  field :cpc, type:Float
  field :epc, type:Float
  field :per_advp, type:Hash
  field :advertising_partners, type:Array
  field :ci_ids, type:Array
  field :clickins, type:Array
  field :click_type, type:String


  index time: 1, keyword:1, portal:1
  index time: 1
  index keyword:1, portal:1

end