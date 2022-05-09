class Appointment
    attr_accessor :location, :purpose, :hour, :min
    def initialize(location, purpose, hour, min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
    def location()
        @location
    end
    def purpose()
        @purpose
    end
    def hour()
        @hour
    end
    def min()
        @min
    end
end

class MonthlyAppointment < Appointment
    attr_accessor :day
    def initialize(location, purpose, hour, min, day)
        @day = day
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
    def day()
        @day
    end
    def occurs_on?(day)
        if self.day == day
            true
        else
            false
        end        
    end
    def to_s
        "Reunión mensual en #{@location} sobre #{@purpose} el día #{@day} a la(s) #{@hour}:#{@min}."
    end
end

class DailyAppointment < Appointment
    def occurs_on?(hour, min)
        if self.hour == hour and self.min == min
            true
        else
            false
        end
    end
    def to_s
        "Reunión diaria en #{@location} sobre #{@purpose} a la(s) #{@hour}:#{@min}."
    end
end

class OneTimeAppointment < Appointment
    attr_accessor :day, :month, :year
    def initialize(location, purpose, hour, min, day, month, year)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
        @day = day
        @month = month
        @year = year
    end
    def day()
        @day
    end
    def month()
        @month
    end
    def year()
        @year
    end
    def occurs_on?(day, month, year)
        if self.day == day and self.month == month and self.year == year
            true
        else
            false
        end
    end
    def to_s
        "Reunión única en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{@year} a la(s) #{@hour}:#{@min}."
    end
end

puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019).occurs_on?(4, 6, 2019)
puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15).occurs_on?(8, 15)
puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23).occurs_on?(23)