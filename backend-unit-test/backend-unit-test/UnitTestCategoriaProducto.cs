﻿﻿using backend.connection;
using backend.entidades;
using backend.servicios;


namespace backend_unit_test
{

    public class UnitTestCategoriaProducto
    {

        public UnitTestCategoriaProducto()
        {
            BDManager.GetInstance.ConnectionString = "workstation id=cristianmiranda.mssql.somee.com;packet size=4096;user id=cristian_miranda_SQLLogin_1;pwd=gi93dcxks7;data source=cristianmiranda.mssql.somee.com;persist security info=False;initial catalog=cristianmiranda";
        }

        [Fact]
        public void CategoriaProducto_Get_Verificar_NotNull()
        {
            var result = CategoriaProductoServicios.ObtenerTodo<CategoriaProducto>();
            Assert.NotNull(result);
        }

        [Fact]
        public void CategoriaProducto_GetById_VerificarItem()
        {
            var result = CategoriaProductoServicios.ObtenerById<CategoriaProducto>(1);
            Assert.Equal(1, result.Id);
        }

        [Fact]
        public void CategoriaProducto_Insertar()
        {
            CategoriaProducto categoriaProductoTemp = new()
            {
                Nombre = "Nombre Test"
            };

            var result = CategoriaProductoServicios.InsertCategoriaProducto(categoriaProductoTemp);
            Assert.Equal(1, result);
        }

        [Fact]
        public void CategoriaProducto_Actualizar()
        {
            CategoriaProducto categoriaProductoTemp = new()
            {
                Id = 105,
                Nombre = "Nombre Test Edit"
            };

            var result = CategoriaProductoServicios.UpdateCategoriaProducto(categoriaProductoTemp);
            Assert.Equal(1, result);
        }


        [Fact]
        public void CategoriaProducto_Eliminar()
        {
            var result = CategoriaProductoServicios.DeleteCategoriaProducto(105);
            Assert.Equal(1, result);
        }
    }
}