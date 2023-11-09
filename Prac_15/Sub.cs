using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.Sql;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Data;

namespace Prac_15
{
    static class Sub
    {
        public static SqlConnection sql = new SqlConnection(@"Data Source=DESKTOP-JBSVKHP\SQLEXPRESS1;Initial Catalog=Prac_15;Integrated Security=True");

        public static bool Login(string log, string pass)
        {
            sql.Open();
            SqlCommand com = new SqlCommand($"select 1 from Пользователь where Логин = '{log}' and Пароль = '{pass}'", sql);

            if (com.ExecuteScalar() != null)
                { sql.Close(); return true; }
            else
                { sql.Close(); return false; }
        }

        public static string Registration(string log, string pass, string surname, string name, string patronymic)
        {
            sql.Open();
            SqlCommand com = new SqlCommand($"select Логин from Пользователь where Логин = '{log}'" ,sql);
            if (com.ExecuteScalar() == null)
            {
                SqlCommand com2 = new SqlCommand($"insert into Пользователь values('{log}', '{pass}', '{surname}', '{name}', '{patronymic}')", sql);
                com2.ExecuteNonQuery();
                sql.Close();
                return "Ok";
            }
            else {sql.Close(); return "Have"; }
        }

        public static bool RegexPass(string pass)
        {
            Regex r = new Regex(@"^(?=.{6,}$)");
            if (r.IsMatch(pass)) return true;
            else return false;
        }

        public static List<string> TakeListTests()
        {
            List<string> list = new List<string>();

            sql.Open();
            SqlCommand com = new SqlCommand($"select Название from Тест", sql);
            SqlDataReader dr = com.ExecuteReader();

            while (dr.Read())
            {
                list.Add(dr.GetString(0));
            }
            sql.Close();
            return list;
        }

        public static int SumQuest(string nameTest)
        {
            sql.Open();
            SqlCommand com = new SqlCommand($"select count(*) from Вопрос, Тест where Вопрос.НомерТеста = Тест.Код and Тест.Название = '{nameTest}'", sql);
            int Sum = (int)com.ExecuteScalar();
            sql.Close();
            return Sum;
        }

        public static List<List<string>> Questions(string nameTest)
        {
            List<List<string>> lists = new List<List<string>>();

            sql.Open();
            SqlCommand com = new SqlCommand($"select НомерВопроса, Вопрос, Вариант1, Вариант2, Вариант3, Ответ from Вопрос, Тест where НомерТеста = Тест.Код and Тест.Название = '{nameTest}'", sql);
            SqlDataReader reader = com.ExecuteReader();
            while (reader.Read())
            {
                lists.Add(new List<string>()
                {
                    reader.GetString(0),
                    reader.GetString(1),
                    reader.GetString(2),
                    reader.GetString(3),
                    reader.GetString(4),
                    reader.GetString(5)
                });
            }
            sql.Close();
            reader.Close();
            return lists;
        }

        public static void AddHistory(string Name, int NumberTest, int Result, int Count, TimeSpan time)
        {
            int Grade = KnowGrade(Result);
            sql.Open();
            SqlCommand com = new SqlCommand($"insert into История values('{Name}', '{NumberTest}', '{Grade}', '{Count}', '{time}', '{DateTime.Now}')", sql);
            com.ExecuteNonQuery();
            sql.Close();
        }

        public static int KnowGrade(int points)
        {
            if (points < 50)
                return 2;
            else if (points < 75)
                return 3;
            else if (points < 90)
                return 4;
            else
                return 5;
        }

        public static DataTable HistoryWorkers(string name, string plus)
        {
            sql.Open();

            SqlCommand com = new SqlCommand($"select Тест.Название as Название, История.Результат, История.КоличествоБаллов as Баллы, История.Дата," +
                $"История.Время from Тест inner join История on Тест.Код = История.НомерТеста where Пользователь = '{name}' {plus}", sql);
            com.ExecuteNonQuery();
            SqlDataAdapter dataAdp = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            dataAdp.Fill(dt);
            sql.Close();

            return dt;
        }


    }
}
