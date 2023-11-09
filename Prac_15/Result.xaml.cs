using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Prac_15
{
    /// <summary>
    /// Логика взаимодействия для Result.xaml
    /// </summary>
    public partial class Result : Window
    {
        public int CurrentAnswer;
        public int AllCountQuest;
        public string NameUser;
        public int NumberTest;
        public TimeSpan Time;

        public Result(int CurrentAnswer, int AllCountQuest, string nameUser, int numberTest, TimeSpan Time)
        {
            InitializeComponent();

            this.CurrentAnswer = CurrentAnswer;
            this.AllCountQuest = AllCountQuest;
            this.NameUser = nameUser;
            this.NumberTest = numberTest;
            this.Time = Time;
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            SumPoint.Content = $"Вы набрали {CurrentAnswer} баллов из {AllCountQuest}";
        }

        private void Next_Click(object sender, RoutedEventArgs e)
        {
            User u = new User(NameUser);
            u.Show();
            this.Close();

            int Result = (CurrentAnswer * 100) / AllCountQuest;
            Sub.AddHistory(NameUser, NumberTest, Result, CurrentAnswer, Time);
        }
    }
}
