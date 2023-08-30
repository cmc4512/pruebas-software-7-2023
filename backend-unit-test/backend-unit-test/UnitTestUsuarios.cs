using backend.connection;
using backend.entidades;
using backend.servicios;

namespace backend_unit_test
{
    public class UnitTestUsuarios
    {

        public UnitTestUsuarios()
        {
            BDManager.GetInstance.ConnectionString = "workstation id=cristianmiranda.mssql.somee.com;packet size=4096;user id=cristian_miranda_SQLLogin_1;pwd=gi93dcxks7;data source=cristianmiranda.mssql.somee.com;persist security info=False;initial catalog=cristianmiranda";
        }

        [Fact]
        public void Usuarios_Get_Verificar_NotNull()
        {
            var result = UsuariosServicios.ObtenerTodo<Usuarios>();
            Assert.NotNull(result);
        }

        [Fact]
        public void Usuarios_GetById_VerificarItem()
        {
            var result = UsuariosServicios.ObtenerById<Usuarios>(1);
            Assert.Equal(1, result.Id);
        }

        [Fact]
        public void Usuarios_Insertar()
        {
            Usuarios usuarioTemp = new()
            {
                NombreCompleto = "Nombre Test",
                UserName = "UserName Test",
                Password = "Password Test"
            };

            var result = UsuariosServicios.InsertUsuario(usuarioTemp);
            Assert.Equal(1, result);
        }

        [Fact]
        public void Usuario_Actualizar()
        {
            var usuarios = new Usuarios
            {
                Id = 1,
                UserName = "untest1",
                NombreCompleto = "UserName Test1",
                Password = "Password Test1"
            };

            int result = UsuariosServicios.UpdateUsuarios(usuarios);
            Assert.Equal(1, result);
        }


        [Fact]
        public void Usuarios_Delete_EliminacionExitosa()
        {
            // Arrange
            int idUsuarioAEliminar = 122; // Reemplaza con el ID correcto a eliminar

            // Act
            int result = UsuariosServicios.DeleteUsuarios(idUsuarioAEliminar);

            // Assert
            Assert.Equal(1, result);
        }


    }

    

    

    