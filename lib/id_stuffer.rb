module IdStuffer

  # compress the list of ids as good as I could imagine ;)
  # uses fancy base twisting
  def self.stuff(list)
    return "IdS" if list.length == 0
    "IdS" << (list.sort.uniq.map(&:to_i).inject([[-9,-9]]) do |l, c|
      if l.last.last+1 == c
        l.last[-1] = c
        l
      else
        l << [c,c]
      end
    end.map do |r|
      if r.first == r.last
        r.first.to_s(8)
      else
        r.first.to_s(8) << "8" << r.last.to_s(8)
      end
    end[1..-1].join("9").to_i.to_s(36))
  end

  # inverse of compress_id_list
  def self.unstuff(str)
    return [] if !str.present? or str=='0' or str=='IdS'
    raise "Corrupted id list. Or a bug ;)" unless str.start_with?("IdS")
    n = str[3..-1].to_i(36).to_s.split("9").map do |e|
      p = e.split("8")
      if p.length == 1 then p[0].to_i(8)
      elsif p.length == 2 then (p[0].to_i(8)..p[1].to_i(8)).entries
      else raise "Corrupted id list. Or a bug ;)"
      end
    end.flatten.map &:to_s
  end

end