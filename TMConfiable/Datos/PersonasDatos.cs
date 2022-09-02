using TMConfiable.Models;
using System.Data.SqlClient;
using System.Data;
using System.Reflection.Metadata.Ecma335;

namespace TMConfiable.Datos
{
    public class PersonasDatos
    {
        public List<PersonasModel> ListarPersonas()
        {
            var oLista = new List<PersonasModel>();
            var cn = new Conexion();
            using (var conexion = new SqlConnection(cn.getCadenaSQL()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("SpListarPersonas", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        oLista.Add(new PersonasModel()
                        {
                            IdPersonas = Convert.ToInt32(dr["IdPersonas"]),
                            DocIdentificacion = dr["DocIdentificacion"].ToString(),
                            Nombres = dr["Nombres"].ToString(),
                            Apellidos = dr["Apellidos"].ToString(),
                            Email = dr["Email"].ToString(),
                            Rol = dr["Rol"].ToString(),
                            Credencial = dr["Credencial"].ToString(),
                            NivelEducativo = dr["NivelEducativo"].ToString(),
                            CiudadDireccion = dr["CiudadDireccion"].ToString(),
                        });
                    }
                }
            }
            return oLista;
        }

        public PersonasModel ObtenerPersona(int IdPersonas)
        {
            var oPersona = new PersonasModel();
            var cn = new Conexion();
            using (var conexion = new SqlConnection(cn.getCadenaSQL()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("SpObtenerPersonas", conexion);
                cmd.Parameters.AddWithValue("idPersonas", IdPersonas);
                cmd.CommandType = CommandType.StoredProcedure;
                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        oPersona.IdPersonas = Convert.ToInt32(dr["IdPersonas"]);
                        oPersona.DocIdentificacion = dr["DocIdentificacion"].ToString();
                        oPersona.Nombres = dr["Nombres"].ToString();
                        oPersona.Apellidos = dr["Apellidos"].ToString();
                        oPersona.Email = dr["Email"].ToString();
                        oPersona.Rol = dr["Rol"].ToString();
                        oPersona.Credencial = dr["Credencial"].ToString();
                        oPersona.NivelEducativo = dr["NivelEducativo"].ToString();
                        oPersona.CiudadDireccion = dr["CiudadDireccion"].ToString();
                    }
                }
            }
            return oPersona;
        }

        public bool GuardarPersona(PersonasModel opersona)
        {
            bool respuesta;
            try
            {
                var cn = new Conexion();
                using (var conexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("SpGuardarPersonas", conexion);
                    cmd.Parameters.AddWithValue("DocIdentificacion", opersona.DocIdentificacion);
                    cmd.Parameters.AddWithValue("Nombres", opersona.Nombres);
                    cmd.Parameters.AddWithValue("Apellidos", opersona.Apellidos);
                    cmd.Parameters.AddWithValue("Email", opersona.Email);
                    cmd.Parameters.AddWithValue("Rol", opersona.Rol);
                    cmd.Parameters.AddWithValue("Credencial", opersona.Credencial);
                    cmd.Parameters.AddWithValue("NivelEducativo", opersona.NivelEducativo);
                    cmd.Parameters.AddWithValue("CiudadDireccion", opersona.CiudadDireccion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();                  
                }
                respuesta = true;
            } catch (Exception e)
            {
                string error = e.Message;
                respuesta = false;
            }
            return respuesta;
        }

        public bool ModificarPersona(PersonasModel opersona)
        {
            bool respuesta;
            try
            {
                var cn = new Conexion();
                using (var conexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("SpModificarPersonas", conexion);
                    cmd.Parameters.AddWithValue("IdPersonas", opersona.IdPersonas);
                    cmd.Parameters.AddWithValue("DocIdentificacion", opersona.DocIdentificacion);
                    cmd.Parameters.AddWithValue("Nombres", opersona.Nombres);
                    cmd.Parameters.AddWithValue("Apellidos", opersona.Apellidos);
                    cmd.Parameters.AddWithValue("Email", opersona.Email);
                    cmd.Parameters.AddWithValue("Rol", opersona.Rol);
                    cmd.Parameters.AddWithValue("Credencial", opersona.Credencial);
                    cmd.Parameters.AddWithValue("NivelEducativo", opersona.NivelEducativo);
                    cmd.Parameters.AddWithValue("CiudadDireccion", opersona.CiudadDireccion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                }
                respuesta = true;
            }
            catch (Exception e)
            {
                string error = e.Message;
                respuesta = false;
            }
            return respuesta;
        }

        public bool EliminarPersona(int IdPersona)
        {
            bool respuesta;
            try
            {
                var cn = new Conexion();
                using (var conexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("SpEliminarPersonas", conexion);
                    cmd.Parameters.AddWithValue("IdPersonas", IdPersona);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                }
                respuesta = true;
            }
            catch (Exception e)
            {
                string error = e.Message;
                respuesta = false;
            }
            return respuesta;
        }

    }
}
