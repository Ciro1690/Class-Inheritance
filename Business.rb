class Employee

    attr_reader :salary

    def initialize(name, salary, title, boss)
        @name = name
        @salary = salary
        @title = title
        @boss = boss
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end
end

class Manager < Employee
    def initialize
        @employees_under = []
    end

    def bonus(multiplier)
        total_salary = 0
        @employees_under.each do |employee|
            total_salary += employee.salary
        end
        bonus = total_salary * multiplier
    end
end