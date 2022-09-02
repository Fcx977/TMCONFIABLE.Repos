using System.Data;

namespace TMConfiable.Models
{
    public class VehiculosModel
    {
        public int IdVehiculo { get; set; }
        public string Placa { get; set; }
        public int IdPropietario { get; set; }
        public int IdMecanico { get; set; }
        public string? Tipo { get; set; }
        public string? Modelo { get; set; }
        public string? CapacidadPasajetros { get; set; }
        public string? CilindradaMotor { get; set; }
        public string? PaisOrigen { get; set; }
        public string? OtrasCaracteristicas { get; set; }
        public string? NombreSeguro { get; set; }
        public DateTime FechaCompra { get; set; }
        public DateTime FechaVence { get; set; }
               


    }
}
