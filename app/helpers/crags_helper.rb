module CragsHelper
    def crag_full_name(crag)
      crag.name + " (" + crag.country + ")"
    end
end
