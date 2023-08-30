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
    public class EnvioController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly string? connectionString;

        public EnvioController(IConfiguration configuration)
        {
            _configuration = configuration;
            connectionString = _configuration["SqlConnectionString:DefaultConnection"];
            BDManager.GetInstance.ConnectionString = connectionString;
        }

        [HttpGet]
        [Route("GetAllEnvios")]
        public IActionResult GetAllEnvio()
        {
            try
            {
                var result = EnvioServicios.ObtenerTodo<Envio>();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet]
        [Route("GetEnvioById2")]
        public IActionResult GetCajeraById([FromQuery] int id)
        {
            try
            {
                var result = EnvioServicios.ObtenerPorId<Envio>(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("AddEnvio")]
        public IActionResult AddEnvio(Envio envio)
        {
            try
            {
                var result = EnvioServicios.InsertEnvio(envio);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("UpdateEnvio")]
        public IActionResult UpdateEnvio(Envio envio)
        {
            try
            {
                var result = EnvioServicios.UpdateEnvio(envio);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpDelete]
        [Route("DeleteEnvio")]
        public IActionResult DeleteEnvio([FromQuery] int id)
        {
            try
            {
                var result = EnvioServicios.DeleteEnvio(id);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}