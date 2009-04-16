module Menus
  module Admin
    class NewsletterBase < Menu::Group
      define do
        id :main
        parent Sites.new.build(scope).find(:newsletters)
        menu :left, :class => 'left' do
          item :newsletters, :action => :index, :resource => [@site, :newsletter]
          if @newsletter && !@newsletter.new_record?
            item :issues,        :action => :index, :resource => [@newsletter, :issue]
            item :subscriptions, :action => :index, :resource => [@newsletter, :subscription]
          end
        end
      end
    end

    class Newsletter < NewsletterBase
      define do
        menu :right, :class => 'right' do
          activates object.parent.find(:newsletters)
          item :new, :action => :new, :resource => [@site, :newsletter]
          if @newsletter and !@newsletter.new_record?
            item :edit,   :action => :edit,   :resource => @newsletter
            item :delete, :content => link_to_delete(@newsletter)
          end
        end
      end
    end

    class Issues < NewsletterBase
      define do
        menu :right, :class => 'right' do
          activates object.parent.find(:issues)
          item :new, :action => :new, :resource => [@newsletter, :issue]
          if @issue and !@issue.new_record?
            item :view,   :action => :show, :resource => @issue
            item :edit,   :action => :edit, :resource => @issue
            item :delete, :content => link_to_delete(@issue)
          end
        end
      end
    end

    class NewsletterSubscriptions < NewsletterBase
      define do
        menu :right, :class => 'right' do
          activates object.parent.find(:subscriptions)
          item :new, :action => :new, :resource => [@newsletter, :subscription]
        end
      end
    end
  end
end