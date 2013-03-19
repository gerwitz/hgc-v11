# via http://groups.google.com/group/nanoc/browse_thread/thread/c8285c282dbfea7/30b79e5552937019

module Nanoc3::Helpers

    module Relationships
    
        extend Nanoc3::Memoization
        
        def output_parent(page)
            nil == page and return nil
            (page.identifier == '/' or page.binary? or page[:is_hidden]) and return nil
            
            path = page.path.gsub(/[^\/]*$/,'')
            
            @items.sort_by{ |i| i.path.count('/') }.reverse.each do |i|
                (i == page or i.binary? or i[:is_hidden]) and next
                if path =~ /^#{i.path.gsub(/[^\/]+$/,'')}/
                    return i
                end
            end
            raise "error finding parent" # should never reach this point
        end
        memoize :output_parent
        
        def output_children(page)
            nil == page and return []
            page.binary? and return nil
            return @items.select { |i| output_parent(i) == page }
        end
        memoize :output_children
        
    end

end