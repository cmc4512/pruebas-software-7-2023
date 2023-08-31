using backend.connection;
using backend.entidades;
using backend.servicios;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [EnableCors("CorsDev")]
    [ApiController]
    [Route("api/[controller]")]
    public class PedidoController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly string? connectionString;

        public PedidoController(IConfiguration configuration)
        {
            _configuration = configuration;
            connectionString = _configuration["SqlConnectionString:DefaultConnection"];
            BDManager.GetInstance.ConnectionString = connectionString;
        }

        [HttpGet]
        [Route("GetAllPedido")]
        public IActionResult GetAllPedido()
        {
            try
            {
                var result = PedidoServicios.ObtenerTodo<Pedidos>();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet]
        [Route("GetPedidoById")]
        public IActionResult GetPedidoById([FromQuery] int id)
        {
            try
            {
                var result = PedidoServicios.ObtenerPorId<Pedidos>(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("AddPedido")]
        public IActionResult AddPedido(Pedidos pedido)
        {
            try
            {
                var result = PedidoServicios.InsertPedido(pedido);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("UpdatePedido")]
        public IActionResult UpdatePedidos(Pedidos pedido)
        {
            try
            {
                var result = PedidoServicios.UpdatePedido(pedido);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpDelete]
        [Route("DeletePedido")]
        public IActionResult DeletePedido([FromQuery] int id)
        {
            try
            {
                var result = PedidoServicios.DeletePedido(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}