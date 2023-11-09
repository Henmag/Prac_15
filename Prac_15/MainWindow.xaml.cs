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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Prac_15
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void L_Enter_Click(object sender, RoutedEventArgs e)
        {
            if (L_Pass_P.Visibility == Visibility.Visible)
            {
                if (Sub.Login(L_Lodin.Text, L_Pass_P.Password) == true)
                {
                    StartTest st = new StartTest(L_Lodin.Text);
                    st.Show();
                    this.Hide();
                }
                else MessageBox.Show("Ошибка ввода логина или пароля!", "Ошибка входа");
            }
            else if (L_Pass_T.Visibility == Visibility.Visible)
            {
                if (Sub.Login(L_Lodin.Text, L_Pass_T.Text) == true)
                {
                    StartTest st = new StartTest(L_Lodin.Text);
                    st.Show();
                    this.Hide();
                }
                else MessageBox.Show("Ошибка ввода логина или пароля!", "Ошибка входа");
            }
        }

        private void L_Reg_Click(object sender, RoutedEventArgs e)
        {
            Pages.SelectedItem = Page2;
        }

        private void ViewPass_Click(object sender, RoutedEventArgs e)
        {
            if (L_Pass_P.Visibility == Visibility.Visible)
            {
                string pass = L_Pass_P.Password;
                L_Pass_T.Text = pass;

                L_Pass_T.Visibility = Visibility.Visible;
                L_Pass_P.Visibility = Visibility.Hidden;
            }
            else if (L_Pass_T.Visibility == Visibility.Visible)
            {
                string pass = L_Pass_T.Text;
                L_Pass_P.Password = pass;

                L_Pass_P.Visibility = Visibility.Visible;
                L_Pass_T.Visibility = Visibility.Hidden;
            }
        }

        private void R_Clear_Click(object sender, RoutedEventArgs e)
        {
            R_Surname.Text = null;
            R_Name.Text = null;
            R_Patronymic.Text = null;
            R_Login.Text = null;
            R_Pass_1.Text = null;
            R_Pass_2.Text = null;
        }

        private void R_Reg_Click(object sender, RoutedEventArgs e)
        {
            if((R_Surname.Text.Length > 0) && (R_Name.Text.Length > 0) && (R_Login.Text.Length > 0) &&
                (R_Pass_1.Text.Length > 0) && (R_Pass_2.Text.Length > 0))
            {
                if (Sub.RegexPass(R_Pass_1.Text) == true)
                {
                    if (R_Pass_1.Text == R_Pass_2.Text)
                    {
                        //if (Sub.Registration(R_Login.Text, R_Pass_1.Text, R_Surname.Text, R_Name.Text, R_Patronymic.Text) == true)
                        //    MessageBox.Show("Регистрация успешна!", "Ура!!!");
                        //else MessageBox.Show("Ошибка занесения данных в базу данных", "Ошибка регистрации");

                        //MessageBox.Show(Sub.Registration(R_Login.Text, R_Pass_1.Text, R_Surname.Text, R_Name.Text, R_Patronymic.Text).ToString());
                        if (Sub.Registration(R_Login.Text, R_Pass_1.Text, R_Surname.Text, R_Name.Text, R_Patronymic.Text) == "Ok")
                        {
                            MessageBox.Show("Удачно");
                        }
                        else MessageBox.Show("Данный логин уже используется, пожалуйста выберите другой!", "Ошибка регистрации");
                    }
                    else MessageBox.Show("Пароли не совпадают!", "Ошибка регистрации");
                }
                else MessageBox.Show("Пароль должен быть не менее 6 символов!", "Ошибка регистрации");
            }
            else MessageBox.Show("Не все поля заполнены ((", "Ошибочка");
        }
    }
}
