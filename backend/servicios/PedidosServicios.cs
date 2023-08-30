using System.Data;
using backend.connection;
using backend.entidades;
using Dapper;

namespace backend.servicios
{
    public static class PedidoServicios
    {
        public static IEnumerable<T> ObtenerTodo<T>()
        {
            const string sql = "SELECT TOP 5 * FROM PEDIDO ORDER BY ID DESC";
            return BDManager.GetInstance.GetData<T>(sql);
        }

        public static T ObtenerPorId<T>(int id)
        {
            const string sql = "SELECT * FROM PEDIDO WHERE ID = @Id AND ESTADO_REGISTRO = 1";

            var parameters = new DynamicParameters();
            parameters.Add("Id", id, DbType.Int32);

            var result = BDManager.GetInstance.GetDataWithParameters<T>(sql, parameters);

            return result.FirstOrDefault();
        }

        public static int InsertPedido(Pedidos pedido)
        {
            const string sql = "INSERT INTO PEDIDO (ID_USUARIO, ID_ENVIO, FECHA_PRODUCTO, CANTIDAD, ESTADO) VALUES (@idUsuario, @idEnvio, @fechaProducto, @cantidad, @estado)";

            var parameters = new DynamicParameters();
            parameters.Add("idUsuario", pedido.IdUsuario, DbType.Int32);
            parameters.Add("idEnvio", pedido.IdEnvio, DbType.Int32);
            parameters.Add("fechaProducto", pedido.FechaProducto, DbType.DateTime);
            parameters.Add("cantidad", pedido.Cantidad, DbType.Decimal);
            parameters.Add("estado", pedido.Estado, DbType.String);

            var result = BDManager.GetInstance.SetData(sql, parameters);
            return result;
        }

        public static int UpdatePedido(Pedidos pedido)
        {
            const string sql = "UPDATE PEDIDO SET ID_USUARIO = @idUusario, ID_ENVIO = @idEnvio, FECHA_PRODUCTO = @fechaProducto, CANTIDAD = @Cantidad, ESTADO = @Estado WHERE ID = @id";

            var parameters = new DynamicParameters();
            parameters.Add("id", pedido.Id, DbType.Int32);
            parameters.Add("idUsuario", pedido.IdUsuario, DbType.Int32);
            parameters.Add("idEnvio", pedido.IdEnvio, DbType.Int32);
            parameters.Add("fechaProducto", pedido.FechaProducto, DbType.DateTime);
            parameters.Add("cantidad", pedido.Cantidad, DbType.Decimal);
            parameters.Add("estado", pedido.Estado, DbType.String);

            var result = BDManager.GetInstance.SetData(sql, parameters);
            return result;
        }

        public static int DeletePedido(int id)
        {
            const string sql = "DELETE FROM PEDIDO WHERE ID = @id";

            var parameters = new DynamicParameters();
            parameters.Add("id", id, DbType.Int32);

            var result = BDManager.GetInstance.SetData(sql, parameters);
            return result;
        }
    }
}