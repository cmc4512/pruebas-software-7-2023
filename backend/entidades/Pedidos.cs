namespace backend.entidades
{
    public class Pedidos : Common
    {
        public int Id { get; set; }
        public int IdUsuario { get; set; }
        public int IdEnvio { get; set; }
        public int fechaPedido { get; set; }
        public decimal Cantidad { get; set; }
        public string Estado { get; set; }
    

    }
}