class Employee

    attr_reader :name, :salary, :title
    attr_accessor :boss

    def initialize(name, salary, title, boss = nil)
        @name = name
        @salary = salary
        @title = title
        self.boss = boss
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end

end

class Manager < Employee

    attr_reader :employee

    def initialize(name,salary,title,boss=nil)
        super(name,salary,title,boss)
        @employees_under = []
    end

    def employees_under(employee)
        @employees_under << employee
    end

    def bonus(multiplier)
        total_salary = 0
        @employees_under.each do |employee|
            total_salary += employee.salary
        end
        bonus = total_salary * multiplier
        return bonus
    end
end

shawna = Employee.new("Shawna", 12000, "TA", "Darren")
david = Employee.new("David", 10000, "TA", "Darren")
darren = Manager.new("Darren", 78000, "TA Manager")
ned = Manager.new("Ned", 1000000, "Founder", nil)

ned.employees_under(darren)
ned.employees_under(david)
ned.employees_under(shawna)
darren.employees_under(david)
darren.employees_under(shawna)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000