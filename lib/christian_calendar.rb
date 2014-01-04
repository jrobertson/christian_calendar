#!/usr/bin/env ruby

#file: christian_calendar.rb

require 'easter'
require 'chronic'

MINUTE = 60
HOUR = MINUTE * 60
DAY = HOUR * 24
WEEK = DAY * 7
MONTH = DAY * 30

class ChristianCalendar

  def initialize(year=Time.now.year)
    @year = year    
  end

  def epiphany()
    christmas(@year - 1) + DAY * 12
  end

  def st_davids_day(year=@year)
    Time.local(year, 3, 1)
  end

  alias saint_davids_day st_davids_day

  def ash_wednesday()
    Easter.ash_wednesday(@year)
  end

  def mothering_sunday()
    Chronic.parse('sunday', now: ash_wednesday) + WEEK * 3
  end

  def st_patricks_day(year=@year)
    Time.local(year, 3, 17)
  end

  alias saint_patricks_day st_patricks_day

  def palm_sunday()
    Easter.palm_sunday(@year)
  end

  def good_friday()
    Easter.good_friday(@year)
  end

  def easter_sunday()
    Easter.easter(@year)
  end

  alias easter easter_sunday

  def whit_sunday()
    Chronic.parse('sunday', \
        now: Chronic.parse('15 May', now: Time.local(@year,1,1)))
  end

  def trinity_sunday()
    Chronic.parse('sunday', now: pentecost)
  end

  def ascension_day()
    Easter.ascension_day(@year)
  end

  def pentecost()
    Easter.pentecost(@year)
  end

  alias pentecost_sunday pentecost

  def st_andrews_day(year=@year)
    Time.local(year, 11, 30)
  end

  alias saint_andrews_day st_andrews_day

  def advent_sunday()    
    Chronic.parse('sunday', now: christmas) - WEEK * 4
  end

  def christmas(year=@year)
    Time.local(year, 12, 25)
  end

  def to_h
    a = %i(epiphany st_davids_day ash_wednesday mothering_sunday)\
    + %i(st_patricks_day palm_sunday good_friday easter_sunday)\
    + %i(whit_sunday trinity_sunday ascension_day pentecost st_andrews_day)\
    + %i(advent_sunday christmas)

    a.inject({}){|r,day| r.merge(day => method(day).call)}
  end
end

if __FILE__ == $0 then

  cc = ChristianCalendar.new
  cc.epiphany
  #cc.mothering_sunday
  #cc.whit_sunday
  #cc.trinity_sunday
  cc.advent_sunday

  cc.to_h
end
