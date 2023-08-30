﻿﻿using backend.connection;
using backend.entidades;
using backend.servicios;


namespace backend_unit_test
{


    public class UnitTestCarritoCompra
    {

        public UnitTestCarritoCompra()
        {
            BDManager.GetInstance.ConnectionString = "workstation id=cristianmiranda.mssql.somee.com;packet size=4096;user id=cristian_miranda_SQLLogin_1;pwd=gi93dcxks7;data source=cristianmiranda.mssql.somee.com;persist security info=False;initial catalog=cristianmiranda";
        }

        [Fact]
        public void CarritoCompra_Get_Verificar_NotNull()
        {
            var result = CarritoCompraServicios.ObtenerTodo<CarritoCompra>();
            Assert.NotNull(result);
        }

        [Fact]
        public void CarritoCompra_GetById_VerificarItem()
        {
            var result = CarritoCompraServicios.ObtenerById<CarritoCompra>(1);
            Assert.Equal(1, result.Id);
        }

        [Fact]
        public void CarritoCompra_Insertar()
        {
            CarritoCompra carritoCompraTemp = new()
            {
                Fecha = DateTime.Now,
                IdUsuario = 101

            };

            var result = CarritoCompraServicios.InsertCarritoCompra(carritoCompraTemp);
            Assert.Equal(1, result);
        }

        [Fact]
        public void CarritoCompra_Actualizar()
        {
            CarritoCompra carritoCompraTemp = new()
            {
                Id = 105,
                Fecha = DateTime.Now,
                IdUsuario = 101
            };

            var result = CarritoCompraServicios.UpdateCarritoCompra(carritoCompraTemp);
            Assert.Equal(1, result);
        }


        [Fact]
        public void CarritoCompra_Eliminar()
        {
            var result = CarritoCompraServicios.DeleteCarritoCompra(105);
            Assert.Equal(1, result);
        }


    }
}