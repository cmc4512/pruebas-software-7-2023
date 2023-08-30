namespace backend.entidades
{
    public class Envio : Common
    {
        public int Id { get; set; }
        public string NombreProducto { get; set; }
        public string Direccion { get; set; }
        public int Cantidad { get; set; }
    }
}