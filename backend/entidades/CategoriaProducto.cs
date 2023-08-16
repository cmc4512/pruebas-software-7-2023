namespace backend.entidades
{
    public class CategoriaProducto : Common
    {
        public int Id { get; set; }

        public string Nombre { get; set; }

        public static object GetById<T>(int v)
        {
            throw new NotImplementedException();
        }

        public static object GetById<T>()
        {
            throw new NotImplementedException();
        }
    }
}