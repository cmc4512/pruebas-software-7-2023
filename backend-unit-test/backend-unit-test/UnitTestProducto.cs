using backend.connection;
using backend.entidades;
using backend.servicios;
using Xunit;


namespace backend_unit_test
{

    public class UnitTestProducto
    {

        public UnitTestProducto()
        {
            BDManager.GetInstance.ConnectionString = "workstation id=cristianmiranda.mssql.somee.com;packet size=4096;user id=cristian_miranda_SQLLogin_1;pwd=gi93dcxks7;data source=cristianmiranda.mssql.somee.com;persist security info=False;initial catalog=cristianmiranda";
        }

        [Fact]
        public void Producto_Get_Verificar_NotNull()
        {
            var result = ProductoServicios.ObtenerTodo<Producto>();
            Assert.NotNull(result);
        }

        [Fact]
        public void Producto_GetById_VerificarItem()
        {
            var result = ProductoServicios.ObtenerById<Producto>(1);
            Assert.Equal(1, result.Id);
        }

        [Fact]
        public void Producto_Insertar()
        {
            Producto productoTemp = new()
            {
                Nombre = "Producto Test",
                IdCategoria = 1
            };

            var result = ProductoServicios.InsertProducto(productoTemp);
            Assert.Equal(1, result);
        }

        [Fact]
        public void Producto_Actualizar()
        {
            var producto = new Producto
            {
                Id = 1,
                Nombre = "Producto Test",
                IdCategoria = 2
            };

            int result = ProductoServicios.UpdateProducto(producto);
            Assert.Equal(1, result);
        }


        [Fact]
        public void Procduto_Eliminar()
        {
            int idToDelete = 1;
            int result = ProductoServicios.DeleteProducto(idToDelete);
            Assert.Equal(1, result);
        }

    }

}