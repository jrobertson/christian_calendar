# Introducing the Christian Calendar gem

    require 'christian_calendar'

    # 2014
    cc = ChristianCalendar.new

    cc.mothering_sunday #=> 2014-03-30 13:00:00 +0100 
    cc.easter_sunday    #=> #<DateTime: 2014-04-20T00:00:00+00:00 (...)> 
    cc.st_andrews_day   #=> 2014-11-30 00:00:00 +0000

    puts cc.to_h.map {|k,v| "%+16s: %s" % [k,v.strftime("%d-%b")]}.join("\n")

output:
<pre>
        epiphany: 06-Jan
   st_davids_day: 01-Mar
   ash_wednesday: 05-Mar
mothering_sunday: 30-Mar
 st_patricks_day: 17-Mar
     palm_sunday: 13-Apr
     good_friday: 18-Apr
   easter_sunday: 20-Apr
     whit_sunday: 18-May
  trinity_sunday: 15-Jun
   ascension_day: 12-Mar
       pentecost: 08-Jun
  st_andrews_day: 30-Nov
   advent_sunday: 30-Nov
       christmas: 25-Dec
</pre>

    # 2015
    cc = ChristianCalendar.new 2015
    puts cc.to_h.map {|k,v| "%+16s: %s" % [k,v.strftime("%d-%b")]}.join("\n")

    # sorting the dates and making the names look presentable
    #
    a = cc.to_h.sort_by{|k, v| v.to_datetime}.map do |k,v| 
      label = k.to_s.sub(/s(?=_)/,"'s").gsub('_', ' ').split.map(&:capitalize).join(' ')
      "%+16s: %s" % [label,v.strftime("%d-%b-%Y")]
    end
    puts a.join("\n")

output:

<pre>
        Epiphany: 06-Jan-2015
   Ash Wednesday: 18-Feb-2015
   Ascension Day: 25-Feb-2015
  St David's Day: 01-Mar-2015
Mothering Sunday: 15-Mar-2015
St Patrick's Day: 17-Mar-2015
     Palm Sunday: 29-Mar-2015
     Good Friday: 03-Apr-2015
   Easter Sunday: 05-Apr-2015
     Whit Sunday: 17-May-2015
       Pentecost: 24-May-2015
  Trinity Sunday: 31-May-2015
   Advent Sunday: 29-Nov-2015
 St Andrew's Day: 30-Nov-2015
       Christmas: 25-Dec-2015
</pre>


## Resources

* [jrobertson/christian_calendar](https://github.com/jrobertson/christian_calendar)
christiancalendar gem calendar days holidays

