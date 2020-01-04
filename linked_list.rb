require_relative "node.rb"

class LinkedList
    
    def initialize
        @head = nil
    end

    def append node
        new_node = Node.new(node)
        if !@head
            @head = new_node
        else
            temp = @head
            while temp.pointer
                temp = temp.pointer
            end
            temp.pointer = new_node
        end
    end

    def prepend node
        new_node = Node.new(node)
        if !@head
            @head = new_node
        else
            new_node.pointer = @head
            @head = new_node
        end
    end

    def size
        return 0 if !@head
        temp = @head
        count = 0
        while temp.pointer
            count += 1
            temp = temp.pointer
        end
        count += 1
        return count
    end

    def head
        return "Empty" if !@head
        return @head.data
    end

    def tail
        return "Empty" if !@head
        temp = @head
        while temp.pointer
            temp = temp.pointer
        end
        return temp.data
    end

    def at index
        raise ArgumentError.new("Cannot use a negative index") if index < 0
        return nil if !@head
        temp = @head
        count = 0
        while temp.pointer && index != count
            temp = temp.pointer
            count += 1
        end
        return temp.data if index == count
        raise IndexError.new("Index out of bounds")
    end

    def pop
        return nil if !@head
        temp = @head
        while temp.pointer.pointer
            temp = temp.pointer
        end
        temp.pointer = nil
    end

    def contains? node
        return false if !@head
        bool = false
        temp = @head
        while temp.pointer && !bool
            temp = temp.pointer
            bool = true if temp.data == node
        end
        return bool
    end

    def find node
        return nil if !@head
        index = 0
        temp = @head
        while temp.pointer && temp.data != node
            index += 1
            temp = temp.pointer
        end
        if temp.data == node
            return index
        else
            return "nil"
        end
    end

    def to_s
        if !@head
            return "Empty Linked List"
        else
            string = ""
            temp = @head
            while temp.pointer
                string += "#{temp.data}, "
                temp = temp.pointer
            end
            string += "#{temp.data}"
            return string
        end
        
    end

    def insert_at node, index
        raise IndexError.new("Must append or prepend first") if !@head
        raise ArgumentError.new("Index must be positive") if index < 0

        new_node = Node.new(node)
        temp = @head
        insert = 0
        while temp.pointer && insert != (index - 1)
            temp = temp.pointer
            insert += 1
        end
        if insert == (index - 1) && temp.pointer
            new_node.pointer = temp.pointer
            temp.pointer = new_node
        else
            temp.pointer = new_node
        end
    end

    def remove_at index
        raise IndexError.new("Nothing to remove") if !@head
        raise ArgumentError.new("Index must be positive") if index < 0

        temp = @head
        remove = 0
        while temp.pointer && remove != (index - 1)
            temp = temp.pointer
            remove += 1
        end
        if remove == (index - 1) && temp.pointer.pointer
            temp.pointer = temp.pointer.pointer
        else
            temp.pointer = nil
        end
    end

end