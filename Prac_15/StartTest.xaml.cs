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
    /// Логика взаимодействия для StartTest.xaml
    /// </summary>
    public partial class StartTest : Window
    {
        public string NameUser;
        public StartTest(string nameUser)
        {
            InitializeComponent();
            NameUser = nameUser;
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            List<string> list = Sub.TakeListTests();

            foreach (string item in list)
            {
                ListTests.Items.Add(item);
            }
        }

        private void GoTest_Click(object sender, RoutedEventArgs e)
        {
            Test t = new Test(ListTests.Text, NameUser, (ListTests.SelectedIndex + 1));
            t.Show();
            this.Close();
        }
        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mw = new MainWindow();
            mw.Show();
            this.Hide();
        }

    }
}
