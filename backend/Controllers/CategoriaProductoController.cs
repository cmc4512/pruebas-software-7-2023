using backend.connection;
using backend.entidades;
using backend.servicios;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers;

[EnableCors("CorsDev")]
[ApiController]
[Route("api/[controller]")]
public class CategoriaProductoController : ControllerBase
{
    private readonly IConfiguration _configuration;
    private readonly string? connectionString;

    public CategoriaProductoController(IConfiguration configuration)
    {
        _configuration = configuration;
        connectionString = _configuration["SqlConnectionString:DefaultConnection"];
        BDManager.GetInstance.ConnectionString = connectionString;
    }

    [HttpGet]
    [Route("GetAllCategoriaProducto")]
    public IActionResult GetAllCategoriaProducto()
    {
        try
        {
            var result = CategoriaProductoServicios.ObtenerTodo<CategoriaProducto>();
            return Ok(result);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }


    [HttpGet]
    [Route("GetCategoriaProductoById")]
    public IActionResult GetCategoriaProductoById([FromQuery] int id)
    {
        try
        {
            var result = CategoriaProductoServicios.ObtenerById<CategoriaProducto>(id);
            return Ok(result);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }

    [HttpPost]
    [Route("AddCategoriaProducto")]
    public IActionResult AddCategoriaProducto(CategoriaProducto categoriaProducto)
    {
        try
        {
            var result = CategoriaProductoServicios.InsertCategoriaProducto(categoriaProducto);
            return Ok(result);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }
     [HttpPost]
    [Route("EditCategoriaProducto")]
    public IActionResult EditCategoriaProducto(CategoriaProducto categoriaProducto)
    {
        try
        {
            var result = CategoriaProductoServicios.UpdateCategoriaProducto(categoriaProducto);
            return Ok("Categoria Actualizada con exito");
        }
        catch (Exception err)
        {
            return StatusCode(500, err.Message);
        }
    }

    [HttpPost]
    [Route("eliminarCategoriaProducto")]
    public IActionResult eliminarCategoriaProducto([FromQuery] int id)
    {
        try
        {
            CategoriaProductoServicios.DeleteCategoriaProducto(id);
            return Ok("Se dio de baja a la categoria del producto correctamente.");
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }
}