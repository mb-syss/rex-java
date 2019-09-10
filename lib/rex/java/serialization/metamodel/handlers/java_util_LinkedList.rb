# -*- coding: binary -*-
class Java_util_LinkedList < Rex::Java::Serialization::Metamodel::ObjectHandlers
  def writeObject(stream, obj, desc)
    elems = obj.fields.fetch('elements', [])
    size = obj.fields.fetch('size', elems.length)
    obj.fields['size'] = size

    stream.defaultWriteObject(obj, desc)

    # size
    stream.writeBytes([elems.length].pack('i>'))

    elems.each do |elem|
      stream.writeObject(elem)
    end
  end
end
