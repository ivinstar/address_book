module GeneralRepository
  extend ActiveSupport::Concern

  included do
    @current_per_page = per_page_min

    scope :per_page, ->(p = nil,l = nil) {
      all = (l == '0') ? true : false

      @current_per_page = l || per_page_min
      unless all
        Kaminari.paginate_array(self.scoped).page((p || 1).to_i).per((l || per_page_min).to_i)
      end
    }
  end

  module ClassMethods

    def current_per_page
      @current_per_page
    end

    def per_page_min
      30
    end

    def per_page_range
      #10,30,50,100,200,300,400,500,all
      s1,s2 = 10,0
      a = [s1] + Range.new(1,3).map{|i| s1 += 20} + Range.new(1,4).map{|i| s2 += 100}
      @per_page_range = Hash[a.map{|v| [v,v]}].merge(I18n.t(:all) => 0)
    end

  end


end