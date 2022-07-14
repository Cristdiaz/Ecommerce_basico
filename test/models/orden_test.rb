require "test_helper"

class OrdenTest < ActiveSupport::TestCase
  test 'Crear un número al azar cuando creo una orden' do
      
    #Arrange/Preparar
      usuario = Usuario.create(email: "usuario@ejemplo.com", password: "Holaola")
      #Act/Actuar
      orden = Orden.create(usuario_id: usuario.id)
      #Assert/Afirmar
      orden_duplicada = orden.dup  #de duplicar
      assert_not orden_duplicada.valid?  #No puede guardarse una orden duplicada
  end


  test 'Agregar producto a la orden' do
      
    #Arrange/Preparar
      usuario = Usuario.create(email: "usuario@ejemplo.com", password: "Holaola")
      #Crear la orden:
      orden = Orden.create(usuario_id: usuario.id)
      #Crear producto:
      producto = producto(:p1)
      producto = Producto.create(nombre'p1', precio: 100, stock: 8, SKU: 'AKDJ12')
      #Actuar:
      orden.agregar_producto(producto.id, 1)
      #Assert/Afirmar
      assert_equal orden.detalles_ordenes.count, 1
  end

  test 'Número de la orden debe ser único' do
      
    #Arrange/Preparar
      usuario = Usuario.create(email: "usuario@ejemplo.com", password: "Holaola")
      #Act/Actuar
      orden = Orden.create(usuario_id: usuario.id)
      #Assert/Afirmar
      assert !orden.numero.nil? #Si es diferente de nil
  end
  
  test 'No agregar productos con 0 stock' do
    # Preparar
    usuario = Usuario.create(email: 'usuario@correo.com', password: '1q2we34r')
    orden = Orden.create(usuario_id: usuario.id)
    producto_sin_stock = Producto.create(nombre: 'testp1', precio: 1, stock: 0, sku: 'CM003')
    # Actuar / Ejecutar
    orden.agregar_producto(producto_sin_stock.id, 1)
    # Asertar
    assert_equal orden.detalles_ordenes.count, 0
  end
  

  

end



  
