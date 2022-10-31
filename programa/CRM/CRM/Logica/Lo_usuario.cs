using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


using CRM.Models;
using System.Data.SqlClient;
using System.Data;
using CRM.Models;
using Microsoft.Data.SqlClient;

namespace CRM.Logica
{
    public class LO_Usuario
    {


        public Usuario EncontrarUsuario(string cedula, string clave)
        {
            
            Usuario objeto = new Usuario();


            using (SqlConnection conexion = new SqlConnection("server=Localhost; database=CRM; User ID=sa; Password=1234;"))
            {

                string query = "select Cedula,Clave,Nombre,Apellido1,Apellido2,id_departamento  from Usuario where Cedula = @pCedula and Clave = @pclave";

                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@pcedula", cedula);
                cmd.Parameters.AddWithValue("@pclave", clave);
                cmd.CommandType = CommandType.Text;


                conexion.Open();


                using (SqlDataReader dr = cmd.ExecuteReader())
                {

                    while (dr.Read())
                    {

                        objeto = new Usuario(){
                            Cedula = dr["Cedula"].ToString(),
                            Clave = dr["Clave"].ToString(),
                            Nombre = dr["Nombre"].ToString(),
                            Apellido1 = dr["Apellido1"].ToString(),
                            Apellido2 = dr["Apellido2"].ToString(),
                            IdDepartamento = dr["id_departamento"].ToString()
                        };
                    }

                }

            }
            return objeto;

        }




    }
}
