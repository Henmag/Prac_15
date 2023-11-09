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
    /// Логика взаимодействия для User.xaml
    /// </summary>
    public partial class User : Window
    {
        public string NameUser;
        public User(string nameUser)
        {
            InitializeComponent();
            NameUser = nameUser;
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Table.ItemsSource = Sub.HistoryWorkers(NameUser, "").DefaultView;

            List<string> list = Sub.TakeListTests();

            foreach (string item in list)
            {
                ListTests.Items.Add(item);
            }
        }
    

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mw = new MainWindow();
            mw.Show();
            this.Close();
        }

        private void Filter_Click(object sender, RoutedEventArgs e)
        {
            Table.ItemsSource = Sub.HistoryWorkers(NameUser, $"and НомерТеста = {(ListTests.SelectedIndex + 1)}").DefaultView;
        }
    }
}
