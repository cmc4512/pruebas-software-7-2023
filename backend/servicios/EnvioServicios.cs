using System.Data;
using backend.connection;
using backend.entidades;
using Dapper;

namespace backend.servicios
{
    public static class EnvioServicios
    {
        public static IEnumerable<T> ObtenerTodo<T>()
        {
            const string sql = "SELECT TOP 5 * FROM ENVIO ORDER BY ID DESC";
            return BDManager.GetInstance.GetData<T>(sql);
        }

        public static T ObtenerPorId<T>(int id)
        {
            const string sql = "SELECT * FROM ENVIO WHERE ID = @Id AND ESTADO_REGISTRO = 1";

            var parameters = new DynamicParameters();
            parameters.Add("Id", id, DbType.Int32);

            var result = BDManager.GetInstance.GetDataWithParameters<T>(sql, parameters);

            return result.FirstOrDefault();
        }

        public static int InsertEnvio(Envio envio)
        {
            const string sql = "INSERT INTO ENVIO (NOMBRE_PRODUCTO, DIRECCION, CANTIDAD) VALUES (@nombreProducto, @direccion, @cantidad)";

            var parameters = new DynamicParameters();
            parameters.Add("nombreProducto", envio.NombreProducto, DbType.String);
            parameters.Add("direccion", envio.Direccion, DbType.String);
            parameters.Add("cantidad", envio.Cantidad, DbType.String);

            var result = BDManager.GetInstance.SetData(sql, parameters);
            return result;
        }

        public static int UpdateEnvio(Envio envio)
        {
            const string sql = "UPDATE ENVIO SET NOMBRE_PRODUCTO = @nombreProducto, DIRECCION = @direccion, CANTIDAD = @cantidad  WHERE ID = @id";

            var parameters = new DynamicParameters();
            parameters.Add("id", envio.Id, DbType.Int32);
            parameters.Add("nombreProducto", envio.NombreProducto, DbType.String);
            parameters.Add("direccion", envio.Direccion, DbType.String);
            parameters.Add("cantidad", envio.Cantidad, DbType.String);

            var result = BDManager.GetInstance.SetData(sql, parameters);
            return result;
        }

        public static int DeleteEnvio(int id)
        {
            const string sql = "DELETE FROM ENVIO WHERE ID = @id";

            var parameters = new DynamicParameters();
            parameters.Add("id", id, DbType.Int32);

            var result = BDManager.GetInstance.SetData(sql, parameters);
            return result;
        }
    }
}