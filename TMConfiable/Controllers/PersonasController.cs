using Microsoft.AspNetCore.Mvc;
using TMConfiable.Datos;
using TMConfiable.Models;

namespace TMConfiable.Controllers
{
    public class PersonasController : Controller
    {
        PersonasDatos personasDatos = new PersonasDatos();
        public IActionResult ListarPersonas()
        {
            // Esta vista retornará la lista de personas
            var oLista = personasDatos.ListarPersonas();
            return View(oLista);
        }

        public IActionResult GuardarPersonas()
        {
            // Esta vista devuelve los datos de la persona que se está trabajando
            return View();
        }

        [HttpPost]
        public IActionResult GuardarPersonas(PersonasModel oPersona)
        {
            // Esta vista recibe los datos de la persona para enviarlos a la base de datos
            var respuesta = personasDatos.GuardarPersona(oPersona);
            if (respuesta)
                return RedirectToAction("ListarPersonas");
            else
                return View();
        }
    }
}

//COMENTARIO FREDY BUSTOS
