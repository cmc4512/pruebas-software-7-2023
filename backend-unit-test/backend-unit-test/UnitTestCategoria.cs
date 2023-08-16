using backend.connection;
using backend.entidades;
using backend.servicios;

namespace backend_unit_test
{
    public class UnitTestCategoria
    {
        public object CategoriaServicios { get; private set; }
        public object Update { get; private set; }

        public UnitTestCategoria() 
        
        {
            BDManager.GetInstance.ConnectionString = "workstation id=cristianmiranda.mssql.somee.com;packet size=4096;user id=cristian_miranda_SQLLogin_1;pwd=gi93dcxks7;data source=cristianmiranda.mssql.somee.com;persist security info=False;initial catalog=cristianmiranda";
        }

        [Fact]
        public void Categoria_Get_Verificar_NotNull()
        {
            var result = CategoriaProducto.GetById<CategoriaProducto>();
            Assert.NotNull(result);
        }

        [Fact]
        public void Categoria_GetById_VerificarItem()
        {
            var result = CategoriaProducto.GetById<CategoriaProducto>(1);
            Assert.Equal(1, result.Id);
        }

        [Fact]
        public void Categoria_Insert_RetornaUno()
        {
            CategoriaProducto categoria= new CategoriaProducto();
            categoria.Nombre = "Categoria UnitTest";

            var result = CategoriaServicios.InsertCategoria(categoria);

            Assert.Equal(1, result);
        }

        [Fact]
        public void Usuario_Update()
        {
            Usuarios usuarioTemp = new()
            {
                Id = 3,
                NombreCompleto = "Nombre Test",
                UserName = "Update UnitTest",
                Password = "Password Test"
            };

        var result = UsuariosServicios.UpdateUsuarios(usuarioTemp);
        Assert.Equal(1, result);
        }
    }
}