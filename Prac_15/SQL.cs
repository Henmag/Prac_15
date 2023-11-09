using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Prac_15
{
    internal class SQL
    {
        public static SqlConnection str; // перменная для подключения

        public static void OpenConnection() // метод подключения к базе данных
        {
            str = new SqlConnection
            {
                ConnectionString = @"Data Source=PC310-11\SQLEXPRESS;Initial Catalog=Канцтовары;Integrated Security=True"
            };
            str.Open(); // открытие соединения
        }

        public static void CloseConnection() // метод закрытия соединения с бд
        {
            str.Close(); // закрытие соединения
        }
        public static bool Exists(string query, string connectionString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                bool exists = reader.HasRows;
                reader.Close();
                return exists;
            }
        }

        public static List<string> Select(String Text, SqlConnection str) // метод запроса данных из бд
        {
            List<string> results = new List<string>(); // объявление массива где будут хранится данные возвращаемые sql за-просом
            SqlCommand command = new SqlCommand(Text, str); // запись sql команды

            SqlDataReader reader = command.ExecuteReader(); // объявление readera для учета данных получаемых из бд
            while (reader.Read()) // запуск цикла среди всех значений полученных запросом из бд
            {
                for (int i = 0; i < reader.FieldCount; i++) // запуск цикла для присвоения значений в массив данных
                    results.Add(reader.GetValue(i).ToString());
            }
            reader.Close(); // закрытие readrea
            command.Dispose();

            return results; // возврат значений метода
        }
        public static DataTable HistoryWorkers(SqlConnection str)
        {
            SqlCommand com = new SqlCommand($"запрос", str); ;
            com.ExecuteNonQuery();
            SqlDataAdapter dataAdp = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            dataAdp.Fill(dt);
            return dt;
        }
    }
}
